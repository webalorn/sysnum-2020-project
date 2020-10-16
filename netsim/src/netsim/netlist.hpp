#if !defined(NETLIST_HPP)
#define NETLIST_HPP

#include <string>
#include <vector>
#include <map>
#include <iostream>

#include "../util/exceptions.hpp"

using uint = uint_fast32_t;
using boolType = uint_fast8_t;

const uint FLAG_OP_CONST = 1 << 1;
const uint FLAG_OP_OR = 1 << 2;
const uint FLAG_OP_XOR = 1 << 3;
const uint FLAG_OP_AND = 1 << 4;
const uint FLAG_OP_NAND = 1 << 5;

const uint FLAG_OP_REG = 1 << 6;
const uint FLAG_OP_RAM = 1 << 7;
const uint FLAG_OP_ROM = 1 << 8;
const uint FLAG_OP_SELECT = 1 << 9;
const uint FLAG_OP_SLICE = 1 << 10;
const uint FLAG_OP_CONCAT = 1 << 11;

const uint FLAG_OP_NOT = 1 << 12;
const uint FLAG_OP_MUX = 1 << 13;
const uint FLAG_RAM_WRITE = 1 << 14;

const uint FLAG_PARAM_0_CST = (1 << 20);
const uint FLAG_PARAM_1_CST = (1 << 21);
const uint FLAG_PARAM_2_CST = (1 << 22);
const uint FLAG_PARAM_3_CST = (1 << 23);
const uint FLAG_PARAM_4_CST = (1 << 24);
const uint FLAG_PARAM_5_CST = (1 << 25);

const uint FLAG_UNARY_OPS = FLAG_OP_REG | FLAG_OP_NOT;
const uint FLAG_BIN_OPS = FLAG_OP_OR | FLAG_OP_XOR | FLAG_OP_AND | FLAG_OP_NAND;
const uint FLAG_BUS_OPS = FLAG_OP_SELECT | FLAG_OP_SLICE | FLAG_OP_CONCAT;

enum Operation {
	OpConst = FLAG_OP_CONST,
	OpOr = FLAG_OP_OR,
	OpXor = FLAG_OP_XOR,
	OpAnd = FLAG_OP_AND,
	OpNand = FLAG_OP_NAND,
	OpReg = FLAG_OP_REG,
	OpRam = FLAG_OP_RAM,
	OpRamWrite = FLAG_RAM_WRITE,
	OpRom = FLAG_OP_ROM,
	OpSelect = FLAG_OP_SELECT,
	OpSlice = FLAG_OP_SLICE,
	OpConcat = FLAG_OP_CONCAT,
	OpNot = FLAG_OP_NOT,
	OpMux = FLAG_OP_MUX,
};

enum ArgType { ArgVariable, ArgBool, ArgInt };

class Memory : public std::vector<char> {
public:
	using std::vector<char>::vector;
	void extend_by(uint);
	void set_size_min(uint);
	inline Memory submem(uint, uint);
	inline uint toInt(uint pos, uint size);
};

std::ostream& operator<<(std::ostream&, const Memory&);

struct Arg {
	std::string repr;
	uint intValue = 0;
	Memory boolValue;
	ArgType type = ArgVariable;

	Arg(std::string, bool = false);
	Arg(uint);
};

struct Variable {
	std::string name;
	Operation operation;
	uint size, pos;
	std::vector<Arg> args;
};
std::ostream& operator<<(std::ostream&, const Variable&);

struct HardVariable {
	std::string name;
	uint size, memoryPt;
};

struct SoftNetlist {
	std::vector<std::string> inputs, outputs;
	std::map<std::string, Variable> variables;

	void checkVarArgs();
	std::vector<Variable> sorted();
};

class NetlistSim {
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
	std::vector<HardVariable> inputs, outputs;
	Memory rom, ram, state, constants, registers;
	uint nbRegistersOp, inputSize, outputSize;
	std::vector<uint> operations;
	// std::vector<bool> hasBeenExecuted;

public:
	NetlistSim(SoftNetlist&);
	uint getInputSize();
	uint getOutputSize();
	const std::vector<HardVariable>& getInputsVar();
	const std::vector<HardVariable>& getOutputsVar();
	Memory getState();

	void writeRom(const Memory&); // Works only if there is only one ROM
	void setInputs(const Memory&);
	void setInputsSplit(const std::vector<Memory>&);
	Memory getOutputs();
	std::vector<Memory> getOutputsSplit();

	void cycle(uint nbCycles = 1);

protected:
	NetlistSim();
	void init(SoftNetlist& net);

	inline bool boolWithFlag(const uint, const uint);
	inline Memory memWithFlag(const uint, const uint, const uint);
	inline void copyWithFlag(const uint, const uint, const uint, const uint);

	virtual inline void onCycleBegin(uint) {}
	virtual inline void onCycleEnd(uint) {}
};

#endif // NETLIST_HPP
