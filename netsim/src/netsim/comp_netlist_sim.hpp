#if !defined(COMP_NETLIST_SIM_HPP)
#define COMP_NETLIST_SIM_HPP

#include "netlist.hpp"
#include "../computer/periph.hpp"
#include "../computer/hdd.hpp"

class NetsimCompRunner {
protected:
	std::vector<HardVariable> inputs, outputs;
	Memory rom, ram, registers;
	std::vector<boolType> transferTab;
	std::vector<uint> operations;

	int nbCycles;
	std::vector<InputDevice*> inDevices;
	std::vector<OutputDevice*> outDevices;
	std::vector<boolType> inputVals;

	inline bool boolWithFlag(const uint, const uint);
	inline Memory memWithFlag(const uint, const uint, const uint);
	inline void copyWithFlag(const uint, const uint, const uint, const uint);

public:
	void init();
	void cycle(uint n);

	NetsimCompRunner();
	void romFromStream(std::ifstream& romStream);
	void onCycleBegin(uint);
	void onCycleEnd(uint);
	void start();

	std::vector<boolType> getOutputsSplit();
	void setInputsSplit(const std::vector<boolType>&);
};

#endif // COMP_NETLIST_SIM_HPP
