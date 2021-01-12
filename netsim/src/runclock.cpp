#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "netsim/netlist.hpp"
#include "netsim/comp_netlist_sim.hpp"

class ProcRunner : public NetsimCompRunner {
public:
	ProcRunner(uint maxCycles) {
		nbCycles = maxCycles;
		this->init();

		outDevices.push_back(new ConsoleOutDevice);
		inDevices.push_back(new ClockDevice);
		inDevices.push_back(new InitTimeDevice);

		inputVals.resize(inputs.size(), 0);
	}
};


int main(int argc, char* argv[]) {
	std::ios_base::sync_with_stdio(false);
	if (argc < 2) {
		std::cerr << "This command takes 1 or 2 arguments :\n";
		std::cerr << "-> A file for the ROM, containing 0 and 1 chars (all other chars are ignored). Only works if there is at most one ROM operation in the netlist file [REQUIRED]\n";
		std::cerr << "-> The maximum number of cylcles [OPTINAL]\n";
		return -1;
	}

	std::ifstream romStream(argv[1], std::ios::binary);
	uint maxCycles = 0; // -> +INF
	if (argc >= 3) {
		maxCycles = std::stoi(argv[2]);
	}

	ProcRunner net(maxCycles);
	net.romFromStream(romStream);
	net.start();
}
