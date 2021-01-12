#include "../util/io.hpp"
#include "comp_netlist_sim.hpp"

NetsimCompRunner::NetsimCompRunner() {}

void NetsimCompRunner::romFromStream(std::ifstream& romStream) {
	flowBitFromBinary(romStream, this->ram);
}

void NetsimCompRunner::onCycleBegin(uint) {
	for (uint iDevice = 0; iDevice < inDevices.size(); iDevice++) {
		inDevices[iDevice]->run();
		uint val = inDevices[iDevice]->getSignal();
		inputVals[iDevice] = val;
	}
	setInputsSplit(inputVals);
}

void NetsimCompRunner::onCycleEnd(uint) {
	std::vector<boolType> outVals = this->getOutputsSplit();

	uint inputRead = outVals[0];
	if (inputRead < inDevices.size()) {
		inDevices[inputRead]->pop();
	}

	if (outVals[1]) { // Second output is the shutdown signal
		throw StopCycling();
	}
	for (uint iDevice = 0; iDevice < outDevices.size(); iDevice++) {
		int iOutput = iDevice + 2;
		outDevices[iDevice]->send(outVals[iOutput]);
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

std::vector<boolType> NetsimCompRunner::getOutputsSplit() {
	std::vector<boolType> outs(outputs.size());
	for (uint iOutput = 0; iOutput < outputs.size(); iOutput++) {
		outs[iOutput] = transferTab[outputs[iOutput].pos];
	}
	return outs;
}

void NetsimCompRunner::setInputsSplit(const std::vector<boolType>& inputValues) {
	for (uint iInput = 0; iInput < inputValues.size(); iInput++) {
		transferTab[inputs[iInput].pos] = inputValues[iInput];
	}
}
