#if !defined(COMP_NETLIST_SIM_HPP)
#define COMP_NETLIST_SIM_HPP

#include "netlist.hpp"

class NetsimCompRunner : public NetlistSim {
protected:
	int nbCycles;
	std::ifstream& memoryStream;
	Memory inputBuffer;

public:
	void init();
	void cycle(uint n);

	NetsimCompRunner(std::ifstream& mem);
	inline void romFromStream(std::ifstream& romStream);
	virtual void onCycleBegin(uint);
	virtual void onCycleEnd(uint);
	void start();
};

#endif // COMP_NETLIST_SIM_HPP
