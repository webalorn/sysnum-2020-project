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
			if (c == '\n' && words.size()) {
				curWord = "\n";
				nextWord();
			}
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
		if (words[curWord] != "\n") {
			inputs.push_back(words[curWord]);
		}
		curWord++;
	}
	if (curWord >= words.size()) {
		throw UsageError("Missing 'OUTPUT' keyword in the netlist");
	}
	curWord++;

	// Read output variables
	while (words[curWord] != "VAR") {
		if (words[curWord] != "\n") {
			outputs.push_back(words[curWord]);
		}
		curWord++;
	}
	if (curWord >= words.size()) {
		throw UsageError("Missing 'VAR' keyword in the netlist");
	}
	curWord++;

	// Read all variables
	while (words[curWord] != "IN") {
		if (words[curWord] == "\n") {
			curWord++;
			continue;
		}
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
		if (words[curWord] == "\n") {
			curWord++;
			continue;
		}
		auto varName = words[curWord++];
		while (words[curWord] == "\n") { curWord++; }
		auto opName = words[curWord++];
		Variable var = Variable(varName, opWordToOp(opName),
			sizeOfVars[varName], std::vector<Arg>());

		if (var.operation == OpConst) {
			var.args.push_back(Arg(opName)); // Because there is no "operation"
		}
		while (curWord < words.size() && words[curWord] != "\n") {
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
			variables[p.first] = Variable(p.first, OpConst,
				sizeOfVars[p.first], std::vector<Arg>{ Arg("0")});
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

void flowBitFrom(std::ifstream& stream, Memory& mem, bool extend) {
	char c;
	uint iWord = 0;
	uint bitInWord = 0;
	uint curWord = 0;
	while (stream >> c) {
		if (c == '0' || c == '1') {
			uint v = c == '1' ? 1 : 0;
			curWord = curWord | (v << (31 - bitInWord));
			bitInWord++;
			if (bitInWord == 32) {
				if (iWord >= mem.size()) {
					if (!extend) {
						break;
					}
					mem.push_back(curWord);
				}
				else {
					mem[iWord] = curWord;
				}
				bitInWord = 0;
				curWord = 0;
				iWord++;
			}
		}
	}
	if (bitInWord) {
		if (iWord < mem.size()) {
			mem[iWord] = curWord;
		}
		else if (extend) {
			mem.push_back(curWord);
		}
	}
}
