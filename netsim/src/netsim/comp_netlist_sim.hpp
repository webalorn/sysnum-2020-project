#if !defined(COMP_NETLIST_SIM_HPP)
#define COMP_NETLIST_SIM_HPP

#include "netlist.hpp"
#include "../computer/periph.hpp"
#include "../computer/hdd.hpp"

class NetsimCompRunner : public NetlistSim {
protected:
	int nbCycles;
	std::vector<InputDevice*> inDevices;
	std::vector<OutputDevice*> outDevices;
	std::vector<Memory> inputVals;

public:
	void init();
	void cycle(uint n);

	NetsimCompRunner(uint maxCycles, VirtualDrive& drive);
	inline void romFromStream(std::ifstream& romStream);
	virtual void onCycleBegin(uint);
	virtual void onCycleEnd(uint);
	void start();
};

#endif // COMP_NETLIST_SIM_HPP
