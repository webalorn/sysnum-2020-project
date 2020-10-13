#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cctype>
#include <map>

#include "io.hpp"
#include "netsim/netlist.hpp"


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
	int curWord = 1; // The first word MUST be "INPUT"
	std::vector<std::string> inputs, outputs;
	std::map<std::string, int> sizeOfVars;

	for (auto s : words) {
		std::cout << "'" << s << "' ";
	}std::cout << "\n";

	while (words[curWord] != "OUTPUT") {
		inputs.push_back(words[curWord++]);
	}
	curWord++;
	while (words[curWord] != "VAR") {
		outputs.push_back(words[curWord++]);
	}
	curWord++;
	while (words[curWord] != "IN") { // Read variables
		auto varName = words[curWord];
		int varSize = 1;
		if (words[curWord + 1] == ":") {
			varSize = std::stoi(words[curWord + 2]);
			curWord += 3;
		}
		else {
			curWord += 1;
		}
		sizeOfVars[varName] = varSize;
	}
	curWord++;

	// Step 3 : Read expressions
	std::map<std::string, Variable> variables;

	while (curWord < (int)words.size()) { // Read variables
		auto varName = words[curWord++];
		auto opName = words[curWord++];
		Variable var = Variable{ varName, opWordToOp(opName),
			sizeOfVars[varName], 0, std::vector<Arg>() };


		int nbArgs = 2;
		if (var.operation == OpConst) {
			nbArgs = 0;
			var.args.push_back(Arg(opName)); // Because there is no "operation"
		}
		if (var.operation == OpReg) nbArgs = 1;
		if (var.operation == OpRom) nbArgs = 3;
		if (var.operation == OpRam) nbArgs = 6;

		for (int iArg = 0; iArg < nbArgs; iArg++) {
			var.args.push_back(Arg(words[curWord++]));
		}
		// Int parameters
		if (var.operation == OpSelect) {
			var.args[0] = Arg(var.args[0].repr, true);
		}
		if (var.operation == OpRom || var.operation == OpRam) {
			var.args[0] = Arg(var.args[0].repr, true);
			var.args[1] = Arg(var.args[1].repr, true);
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
