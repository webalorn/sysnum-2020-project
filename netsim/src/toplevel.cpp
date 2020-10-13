#include <iostream>
#include <string>
#include <vector>
#include <cctype>

#include "io.hpp"
#include "netsim/netlist.hpp"

bool isValidInput(const std::string& str, int size) {
	for (char c : str) {
		if (c != '0' && c != '1') {
			return false;
		}
	}
	return str.size() == size;
}

std::string removeSpaces(const std::string& str) {
	std::string without;
	for (char c : str) {
		if (!isspace(c)) {
			without.push_back(c);
		}
	}
	return without;
}

void topLevelCycles(int maxCycles, NetlistSim& net) {
	for (; maxCycles; maxCycles--) {
		std::vector<Memory> inMem;
		const auto& inputs = net.getInputsVar();
		std::string line;

		std::cout << "\n====== INPUTS ======\n";
		for (const HardVariable& var : inputs) {
			while (true) {
				std::cout << "In : " << var.name << "[" <<
					var.size << "] = ";
				std::getline(std::cin, line);
				line = removeSpaces(line);

				if (isValidInput(line, var.size)) {
					break;
				}
				else {
					std::cout << "Invalid : you must input a string of 0 and 1 or length" << var.size << "\n";
				}
			}
			inMem.push_back({});
			for (char c : line) {
				inMem.back().push_back(c == '1');
			}
		}

		net.setInputsSplit(inMem);
		net.cycle();

		const auto& outputs = net.getOutputsVar();
		std::vector<Memory> outVals = net.getOutputsSplit();

		std::cout << "\n  --- OUTPUTS ---\n";
		for (int iOutput = 0; iOutput < outputs.size(); iOutput++) {
			std::cout << outputs[iOutput].name << " = ";
			for (bool b : outVals[iOutput]) {
				std::cout << (int)b;
			}
			std::cout << "\n";
		}

	}
}

int main() {
	std::ios_base::sync_with_stdio(false);

	// std::string source = "../../td/sysnum-2020/tp1/test/cm2.net";
	// std::string source = "../../td/sysnum-2020/tp1/test/clock_div.net";
	std::string source = "../../td/sysnum-2020/tp1/test/fulladder.net";
	SoftNetlist softnet = loadNetlistFrom(source);
	NetlistSim net(softnet);

	std::cout << "\n";
	std::cout << "Inputs size = " << net.inputSize << "\n";
	std::cout << "consts = " << net.constants << "\n";
	// std::cout << net.state << "\n";

	topLevelCycles(-1, net);
}
