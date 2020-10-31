#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "netsim/netlist.hpp"
#include "netsim/comp_netlist_sim.hpp"

NetsimCompRunner::NetsimCompRunner(uint maxCycles, VirtualDrive& drive) {
	nbCycles = maxCycles;
	this->init();

	outDevices.push_back(new ConsoleOutDevice());
	outDevices.push_back(new DriveOutput(drive));

	inDevices.push_back(new ClockDevice());
	inDevices.push_back(new DriveInput(drive));

	for (HardVariable& var : inputs) {
		inputVals.push_back(Memory(var.size));
	}
}

inline void NetsimCompRunner::romFromStream(std::ifstream& romStream) {
	flowBitFrom(romStream, this->ram);
}

void NetsimCompRunner::onCycleBegin(uint) {
	for (uint iDevice = 0; iDevice < inDevices.size(); iDevice++) {
		inDevices[iDevice]->run();
		uint val = inDevices[iDevice]->getSignal();
		inputVals[iDevice].fromInt(val);
	}
	setInputsSplit(inputVals);
}

void NetsimCompRunner::onCycleEnd(uint) {
	std::vector<Memory> outVals = this->getOutputsSplit();
	// for (const Memory& m : outVals) {
	// 	std::cout << m << " ";
	// }
	// std::cout << "\n";

	uint inputRead = outVals[0].toInt(0, outVals[0].size());
	if (inputRead < inDevices.size()) {
		inDevices[inputRead]->pop();
	}

	if (outVals[1][0]) { // Second output is the shutdown signal
		throw StopCycling();
	}
	for (uint iDevice = 0; iDevice < outDevices.size(); iDevice++) {
		int iOutput = iDevice + 2;
		outDevices[iDevice]->send(outVals[iOutput].toInt(0, outVals[iOutput].size()));
	}
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
	if (argc < 3) {
		std::cerr << "This command takes 1 or 2 arguments :\n";
		std::cerr << "-> A file for the ROM, containing 0 and 1 chars (all other chars are ignored). Only works if there is at most one ROM operation in the netlist file [REQUIRED]\n";
		std::cerr << "-> A file for the VHDD REQUIRED]\n";
		std::cerr << "-> The maximum number of cylcles [OPTINAL]\n";
		return -1;
	}

	std::ifstream romStream(argv[1]);
	VirtualDrive drive(argv[2]);
	uint maxCycles = 0; // -> +INF
	if (argc >= 4) {
		maxCycles = std::stoi(argv[3]);
	}


	NetsimCompRunner net(maxCycles, drive);
	net.romFromStream(romStream);


	net.start();

	std::cout << "\n\n====== FINAL OUTPUT\n";
	std::vector<Memory> outVals = net.getOutputsSplit();
	for (const Memory& m : outVals) {
		std::cout << m << " ";
	}
	std::cout << "\n";
}
