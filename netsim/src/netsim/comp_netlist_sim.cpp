#include "../util/io.hpp"
#include "comp_netlist_sim.hpp"

NetsimCompRunner::NetsimCompRunner() {}

void NetsimCompRunner::romFromStream(std::ifstream& romStream) {
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
