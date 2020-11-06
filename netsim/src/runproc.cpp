#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>

#include "util/io.hpp"
#include "netsim/netlist.hpp"
#include "netsim/comp_netlist_sim.hpp"
#include "computer/sf_screen.hpp"

class ProcRunner : public NetsimCompRunner {
	VirtualScreen screen;
public:
	ProcRunner(uint maxCycles, VirtualDrive& drive) : screen(100, 100, 5) {
		nbCycles = maxCycles;
		this->init();

		outDevices.push_back(new ConsoleOutDevice);
		outDevices.push_back(new DriveOutput(drive));
		outDevices.push_back(new ScreenOutput(screen));

		inDevices.push_back(new ClockDevice);
		inDevices.push_back(new DriveInput(drive));

		for (HardVariable& var : inputs) {
			inputVals.push_back(Memory(var.size));
		}
	}
};

int main(int argc, char* argv[]) {
	std::ios_base::sync_with_stdio(false);
	if (argc < 3) {
		std::cerr << "This command takes 2 or 3 arguments :\n";
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

	ProcRunner net(maxCycles, drive);
	net.romFromStream(romStream);
	net.start();

	// std::cout << "\n\n====== FINAL OUTPUT\n";
	// std::vector<Memory> outVals = net.getOutputsSplit();
	// for (const Memory& m : outVals) {
	// 	std::cout << m << " ";
	// }
	// std::cout << "\n";
}
