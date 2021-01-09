#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "util/exceptions.hpp"
#include "netsim/netlist.hpp"
#include "netsim/comp_netlist.hpp"

int main(int argc, char* argv[]) {
	std::ios_base::sync_with_stdio(false);
	if (argc < 3) {
		std::cerr << "This command takes 2 argument :\n";
		std::cerr << "-> The netlist file (.net) [REQUIRED]\n";
		std::cerr << "-> The output file (.cpp) [REQUIRED]\n";
		return -1;
	}

	std::ifstream netlistStream(argv[1]);
	std::ofstream outStream(argv[2]);

	NetlistParser parser;
	SoftNetlist softnet = parser.parseFrom(netlistStream);
	genNetlistCode(softnet, outStream);
}
