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
		inputVals[iDevice] = val;
	}
	setInputsSplit(inputVals);
}

void NetsimCompRunner::onCycleEnd(uint) {
	std::vector<boolType> outVals = this->getOutputsSplit();
	// for (auto m : outVals) { // TODO : remove
	// 	std::cout << m << " ";
	// }
	// std::cout << "\n";

	uint inputRead = outVals[0];
	if (inputRead < inDevices.size()) {
		inDevices[inputRead]->pop();
	}

	if (outVals[1]) { // Second output is the shutdown signal
		throw StopCycling();
	}
	for (uint iDevice = 0; iDevice < outDevices.size(); iDevice++) {
		int iOutput = iDevice + 2;
		// if (outVals[iOutput]) { // TODO : remove
		// 	std::cout << "=> ";
		// }
		outDevices[iDevice]->send(outVals[iOutput]);
		// if (outVals[iOutput]) { // TODO : remove
		// 	std::cout << "\n";
		// }
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
		// outs[iOutput] = state[outputs[iOutput].pos] & ((1ull << outputs[iOutput].size) - 1);
		// outs[iOutput] = state[outputs[iOutput].pos];
		outs[iOutput] = transferTab[outputs[iOutput].pos];
	}
	return outs;
}

void NetsimCompRunner::setInputsSplit(const std::vector<boolType>& inputValues) {
	for (uint iInput = 0; iInput < inputValues.size(); iInput++) {
		// state[inputs[iInput].pos] = inputValues[iInput];
		transferTab[inputs[iInput].pos] = inputValues[iInput];
	}
}
