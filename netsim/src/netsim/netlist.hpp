#if !defined(NETLIST_HPP)
#define NETLIST_HPP

#include <string>
#include <vector>
#include <map>
#include <iostream>

const int FLAG_OP_CONST = 1 << 1;
const int FLAG_OP_OR = 1 << 2;
const int FLAG_OP_XOR = 1 << 3;
const int FLAG_OP_AND = 1 << 4;
const int FLAG_OP_NAND = 1 << 5;

const int FLAG_OP_REG = 1 << 6;
const int FLAG_OP_RAM = 1 << 7;
const int FLAG_OP_ROM = 1 << 8;
const int FLAG_OP_SELECT = 1 << 9;
const int FLAG_OP_SLICE = 1 << 10;
const int FLAG_OP_CONCAT = 1 << 11;

const int FLAG_OP_NOT = 1 << 12;
const int FLAG_OP_MUX = 1 << 13;
const int FLAG_RAM_WRITE = 1 << 14;

const int FLAG_PARAM_0_CST = (1 << 20);
const int FLAG_PARAM_1_CST = (1 << 21);
const int FLAG_PARAM_2_CST = (1 << 22);
const int FLAG_PARAM_3_CST = (1 << 23);
const int FLAG_PARAM_4_CST = (1 << 24);
const int FLAG_PARAM_5_CST = (1 << 25);

const int FLAG_UNARY_OPS = FLAG_OP_REG | FLAG_OP_NOT;
const int FLAG_BIN_OPS = FLAG_OP_OR | FLAG_OP_XOR | FLAG_OP_AND | FLAG_OP_NAND;
const int FLAG_BUS_OPS = FLAG_OP_SELECT | FLAG_OP_SLICE | FLAG_OP_CONCAT;

enum Operation {
	OpConst = FLAG_OP_CONST,
	OpOr = FLAG_OP_OR,
	OpXor = FLAG_OP_XOR,
	OpAnd = FLAG_OP_AND,
	OpNand = FLAG_OP_NAND,
	OpReg = FLAG_OP_REG,
	OpRam = FLAG_OP_RAM,
	OpRamWrite = FLAG_RAM_WRITE | FLAG_OP_RAM,
	OpRom = FLAG_OP_ROM,
	OpSelect = FLAG_OP_SELECT,
	OpSlice = FLAG_OP_SLICE,
	OpConcat = FLAG_OP_CONCAT,
	OpNot = FLAG_OP_NOT,
	OpMux = FLAG_OP_MUX,
};

enum ArgType { ArgVariable, ArgBool, ArgInt };

class Memory : public std::vector<bool> {
public:
	using std::vector<bool>::vector;
	void extend_by(int);
	void set_size_min(int);
	inline Memory submem(int, int);
	inline int toInt(int pos, int size);
};

std::ostream& operator<<(std::ostream&, const Memory&);

struct Arg {
	std::string repr;
	int intValue = 0;
	Memory boolValue;
	ArgType type = ArgVariable;

	Arg(std::string, bool = false);
	Arg(int);
};

struct Variable {
	std::string name;
	Operation operation;
	int size, pos;
	std::vector<Arg> args;
};
std::ostream& operator<<(std::ostream&, const Variable&);

struct HardVariable {
	std::string name;
	int size, memoryPt;
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
	int nbRegistersOp, inputSize, outputSize;
	std::vector<int> operations;
	// std::vector<bool> hasBeenExecuted;

public:
	NetlistSim(SoftNetlist&);
	int getInputSize();
	int getOutputSize();
	const std::vector<HardVariable>& getInputsVar();
	const std::vector<HardVariable>& getOutputsVar();
	Memory getState();

	void writeRom(const Memory&); // Works only if there is only one ROM
	void setInputs(const Memory&);
	void setInputsSplit(const std::vector<Memory>&);
	Memory getOutputs();
	std::vector<Memory> getOutputsSplit();

	void cycle();

protected:
	inline bool boolWithFlag(const int, const int);
	inline Memory memWithFlag(const int, const int, const int);
	inline void copyWithFlag(const int, const int, const int, const int);
};

#endif // NETLIST_HPP
