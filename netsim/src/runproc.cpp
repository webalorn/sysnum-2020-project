#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "netsim/netlist.hpp"
#include "netsim/comp_netlist_sim.hpp"

NetsimCompRunner::NetsimCompRunner(std::ifstream& mem) : memoryStream(mem) {
	memoryStream >> nbCycles;
	this->init();
	inputBuffer.resize(getInputSize());
}

inline void NetsimCompRunner::romFromStream(std::ifstream& romStream) {
	flowBitFrom(romStream, this->ram);
}

void NetsimCompRunner::onCycleBegin(uint) {
	// readBitsTo(memoryStream, inputBuffer, inputBuffer.size());
	// setInputs(inputBuffer);
}

void NetsimCompRunner::onCycleEnd(uint) {
	// std::vector<Memory> outVals = this->getOutputsSplit();
	// for (const Memory& m : outVals) {
	// 	std::cout << m << " ";
	// }
	// std::cout << "\n";
	// if (outVals[0][0]) { // First output is the shutdown signal
	// 	throw StopCycling();
	// }
}

void NetsimCompRunner::start() {
	try {
		this->cycle(nbCycles);
	}
	catch (IOError e) {
		std::cerr << "\033[31m[IO ERROR] " << e.get() << "\033[0m\n";
	}
	catch (UsageError e) {
		std::cerr << "\033[31m[USAGE ERROR] " << e.get() << "\033[0m\n";
	}
}

int main(int argc, char* argv[]) {
	std::ios_base::sync_with_stdio(false);
	if (argc < 2) {
		std::cerr << "This command takes 1 or 2 arguments :\n";
		std::cerr << "-> A file cycle containing a single integer (the number of cycle) followed by the input for each cycle [REQUIRED]\n";
		std::cerr << "-> A file for the ROM, containing 0 and 1 chars (all other chars are ignored). Only works if there is at most one ROM operation in the netlist file [OPTIONAL]\n";
		return -1;
	}

	std::ifstream memoryStream(argv[1]);

	NetsimCompRunner net(memoryStream);
	if (argc >= 3) {
		std::ifstream romStream(argv[2]);
		net.romFromStream(romStream);
	}
	net.start();

	std::cout << "\n\n====== FINAL OUTPUT\n";
	std::vector<Memory> outVals = net.getOutputsSplit();
	for (const Memory& m : outVals) {
		std::cout << m << " ";
	}
	std::cout << "\n";
}
