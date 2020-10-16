#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cctype>
#include <map>

#include "io.hpp"

/*
	Read netlists
*/

bool NetlistParser::isSeparator(char c) {
	return std::isspace(c) || c == ':' || c == ',' || c == '=';
}
bool NetlistParser::isWhitelike(char c) {
	return std::isspace(c) || c == ',' || c == '=';
}

void NetlistParser::nextWord() {
	if (curWord.size()) {
		words.push_back(curWord);
		curWord.clear();
	}
}

Operation NetlistParser::opWordToOp(std::string word) {
	if (word == "OR") return OpOr;
	if (word == "XOR") return OpXor;
	if (word == "AND") return OpAnd;
	if (word == "NAND") return OpNand;
	if (word == "REG") return OpReg;
	if (word == "RAM") return OpRam;
	if (word == "ROM") return OpRom;
	if (word == "SELECT") return OpSelect;
	if (word == "SLICE") return OpSlice;
	if (word == "CONCAT") return OpConcat;
	if (word == "NOT") return OpNot;
	if (word == "MUX") return OpMux;
	return OpConst;
}

SoftNetlist NetlistParser::parseFrom(std::ifstream& fileStream) {
	words.clear();
	curWord.clear();

	// STEP 1 : Extract words
	char c;
	while (fileStream.get(c)) {
		if (isSeparator(c)) {
			nextWord();
		}
		if (!isWhitelike(c)) {
			curWord.push_back(c);
			if (isSeparator(c)) { // A separator is always a single word if not white
				nextWord();
			}
		}
	}

	// STEP 2 : Input
	uint curWord = 1; // The first word MUST be "INPUT"
	if (words.empty() || words[0] != "INPUT") {
		throw UsageError("The first word in a netlist must be 'INPUT'");
	}
	std::vector<std::string> inputs, outputs;
	std::map<std::string, uint> sizeOfVars;

	// Read input variables
	while (curWord < words.size() && words[curWord] != "OUTPUT") {
		inputs.push_back(words[curWord++]);
	}
	if (curWord >= words.size()) {
		throw UsageError("Missing 'OUTPUT' keyword in the netlist");
	}
	curWord++;

	// Read output variables
	while (words[curWord] != "VAR") {
		outputs.push_back(words[curWord++]);
	}
	if (curWord >= words.size()) {
		throw UsageError("Missing 'VAR' keyword in the netlist");
	}
	curWord++;

	// Read all variables
	while (words[curWord] != "IN") {
		auto varName = words[curWord];
		uint varSize = 1;
		if (curWord + 2 < words.size() && words[curWord + 1] == ":") {
			try {
				varSize = std::stoi(words[curWord + 2]);
			}
			catch (std::invalid_argument e) {
				throw UsageError("Can't convert " + words[curWord + 2] + " to an integer");
			}
			curWord += 3;
		}
		else {
			curWord += 1;
		}
		sizeOfVars[varName] = varSize;
	}
	if (curWord >= words.size()) {
		throw UsageError("Missing 'IN' keyword in the netlist");
	}
	curWord++;

	// Step 3 : Read expressions
	std::map<std::string, Variable> variables;

	while (curWord < words.size()) { // Read variables
		auto varName = words[curWord++];
		auto opName = words[curWord++];
		Variable var = Variable{ varName, opWordToOp(opName),
			sizeOfVars[varName], 0, std::vector<Arg>() };


		uint nbArgs = 2;
		if (var.operation == OpConst) {
			nbArgs = 0;
			var.args.push_back(Arg(opName)); // Because there is no "operation"
		}
		if (var.operation == OpReg || var.operation == OpNot) nbArgs = 1;
		if (var.operation == OpRom || var.operation == OpMux || var.operation == OpSlice) nbArgs = 3;
		if (var.operation == OpRam) nbArgs = 6;

		if (curWord + nbArgs > words.size()) {
			throw UsageError("Missing arguments for the " + opName + " operation");
		}
		for (uint iArg = 0; iArg < nbArgs; iArg++) {
			var.args.push_back(Arg(words[curWord++]));
		}
		// Int parameters
		if (var.operation == OpRom || var.operation == OpRam || var.operation == OpSlice) {
			var.args[0] = Arg(var.args[0].repr, true);
			var.args[1] = Arg(var.args[1].repr, true);
		}
		if (var.operation == OpSelect) {
			var.args[0] = Arg(var.args[0].repr, true);
		}
		variables[varName] = var;
	}
	for (auto p : sizeOfVars) {
		if (variables.count(p.first) == 0) {
			variables[p.first] = Variable{ p.first, OpConst,
			sizeOfVars[p.first], 0, std::vector<Arg>{ Arg("0")} };
		}
	}

	return SoftNetlist{ inputs, outputs, variables };
}

SoftNetlist loadNetlistFrom(std::string filePath) {
	NetlistParser parser;
	std::ifstream fileStream(filePath);

	return parser.parseFrom(fileStream);
}

/*
	Read streams
*/


void readBitsTo(std::ifstream& stream, Memory& mem, uint size) {
	char c;
	for (uint iBit = 0; iBit < size;) {
		if (stream.get(c)) {
			if (c == '0' || c == '1') {
				mem[iBit++] = c == '1';
			}
		}
		else {
			throw IOError("Can't read bits from stream");
		}
	}
}

void flowBitFrom(std::ifstream& stream, Memory& mem, bool extend) {
	char c;
	uint iBit = 0;
	while (stream >> c) {
		if (c == '0' || c == '1') {
			if (iBit >= mem.size()) {
				if (!extend) {
					break;
				}
				mem.push_back(c == '1');
			}
			else {
				mem[iBit] = (c == '1');
			}
			iBit++;
		}
	}
}
