#if !defined(RECNETLIST_HPP)
#define RECNETLIST_HPP

#include "netlist.hpp"

class RecNetlistSim : public NetlistSim {
	/*
		All registers are at the begining of the operations vector (and state vector)
		operations : [Operation | flags] [memory cell (in state)] [parameters....]
			[block(s) size for REG, MUX (x1) and CONCAT (x2)]

		Parameters can be :
		- an static integer
		- Id of a previous operation (id in 'operations')
		- Id of a constant (id in 'contants'), with a flag set on the operation id

		First parameter for rom / ram : additional parameter for the position in the ram / rom block
	*/
protected:
	std::vector<bool> hasBeenExecuted;

public:
	RecNetlistSim(SoftNetlist&);
	void cycle(uint nbCycles = 1);

protected:
	RecNetlistSim();
	void init(SoftNetlist& net);
};
#endif // RECNETLIST_HPP
