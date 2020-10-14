#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "io.hpp"
#include "netsim/netlist.hpp"
#include "exceptions.hpp"

int main(int argc, char* argv[]) {
	std::ios_base::sync_with_stdio(false);
	if (argc < 3) {
		std::cerr << "This command takes 2 or 3 arguments :\n";
		std::cerr << "-> The netlist file (.net) [REQUIRED]\n";
		std::cerr << "-> A file cycle containing a single integer (the number of cycle) followed by the input for each cycle [REQUIRED]\n";
		std::cerr << "-> A file for the ROM, containing 0 and 1 chars (all other chars are ignored). Only works if there is at most one ROM operation in the netlist file [OPTIONAL]\n";
		return -1;
	}

	std::ifstream netlistStream(argv[1]);
	std::ifstream memoryStream(argv[2]);
	int nbCycles;
	memoryStream >> nbCycles;

	try {
		NetlistParser parser;
		SoftNetlist softnet = parser.parseFrom(netlistStream);
		NetlistSim net(softnet);
		Memory inputMem(net.getInputSize());

		if (argc >= 4) {
			std::ifstream romStream(argv[3]);
			Memory rom;
			flowBitFrom(romStream, rom);
			std::cerr << rom << "\n";
			net.writeRom(rom);
		}

		for (; nbCycles; nbCycles--) {
			readBitsTo(memoryStream, inputMem, inputMem.size());

			net.setInputs(inputMem);
			net.cycle();

			std::vector<Memory> outVals = net.getOutputsSplit();
			for (const Memory& m : outVals) {
				std::cout << m << " ";
			}
			std::cout << "\n";
		}
	}
	catch (IOError e) {
		std::cerr << "\033[31m[IO ERROR] " << e.get() << "\033[0m\n";
	}
	catch (UsageError e) {
		std::cerr << "\033[31m[USAGE ERROR] " << e.get() << "\033[0m\n";
	}
}
