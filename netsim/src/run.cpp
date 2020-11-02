#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "netsim/netlist.hpp"
#include "util/exceptions.hpp"
#include "netsim/recnetlist.hpp"

#ifndef BASE_NETSIM
// #define BASE_NETSIM NetlistSim
#define BASE_NETSIM RecNetlistSim
#endif

class NetsimRunner : public BASE_NETSIM {
private:
	int nbCycles;
	std::ifstream& memoryStream;
	Memory inputBuffer;

public:
	NetsimRunner(std::ifstream& netlistStream, std::ifstream& mem) : memoryStream(mem) {
		memoryStream >> nbCycles;

		NetlistParser parser;
		SoftNetlist softnet = parser.parseFrom(netlistStream);
		this->init(softnet);
		inputBuffer.resize(getInputSize());
	}

	inline void romFromStream(std::ifstream& romStream) {
		flowBitFrom(romStream, this->rom);
	}

	virtual void onCycleBegin(uint) {
		readBitsTo(memoryStream, inputBuffer, inputBuffer.size());
		setInputs(inputBuffer);
	}

	virtual void onCycleEnd(uint) {
		std::vector<Memory> outVals = this->getOutputsSplit();
		for (const Memory& m : outVals) {
			std::cout << m << " ";
		}
		std::cout << "\n";
	}

	void start() {
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
};

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

	NetsimRunner net(netlistStream, memoryStream);
	if (argc >= 4) {
		std::ifstream romStream(argv[3]);
		net.romFromStream(romStream);
	}
	net.start();
}
