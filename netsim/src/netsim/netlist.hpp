#if !defined(NETLIST_HPP)
#define NETLIST_HPP

#include <string>
#include <vector>
#include <map>
#include <iostream>
#include <algorithm>

#include "../util/exceptions.hpp"

using uint = uint_fast32_t;
// using boolType = uint_fast8_t;
using boolType = uint_fast64_t;
using ull = unsigned long long;

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

std::string strOfOp(uint opFlags);

enum ArgType { ArgVariable, ArgBool, ArgInt };

class Memory : public std::vector<boolType> {
public:
	using std::vector<boolType>::vector;
	void extend_by(uint);
	void set_size_min(uint);
	inline Memory submem(uint, uint);
	inline uint toInt(uint pos, uint size);
	inline void fromInt(uint val);
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

struct VarPos {
	uint pos, size, rightOffset;
	bool full;
	uint tabPos;
	VarPos(uint pos = 0, uint size = 0, uint rightOffset = 0, bool full = true);
	VarPos extract(uint begin, uint end);
};

struct Variable {
	std::string name;
	Operation operation;
	uint size;
	VarPos loc;
	std::vector<Arg> args;
	Variable(std::string name, Operation operation, uint size, std::vector<Arg> args);
	inline Variable() {};
};

struct HardVariable {
	std::string name;
	uint pos;
};

struct SoftNetlist {
	std::vector<std::string> inputs, outputs;
	std::map<std::string, Variable> variables;

	void checkVarArgs();
	std::vector<Variable> sorted();
};

// Utility functions


std::ostream& operator<<(std::ostream&, const Variable&);

inline uint sizeOfArg(const Arg& arg, std::map<std::string, uint>& idOfVar,
	std::vector<Variable>& allvars) {
	if (arg.type == ArgVariable) {
		return allvars[idOfVar[arg.repr]].size;
	}
	if (arg.type == ArgInt) {
		throw UsageError("ArgInt doesn't have a size");
	}
	return arg.repr.size();
}

inline void copyFrom(const Memory& memFrom, const uint ptFrom, Memory& memTo, const uint ptTo, const uint n) {
	std::copy(memFrom.begin() + ptFrom, memFrom.begin() + ptFrom + n, memTo.begin() + ptTo);
}

inline uint indexOfConst(Memory& state, std::map<std::string, uint>& memPtOfVar,
	const Memory& boolValue) {
	std::string boolString = "";
	for (bool b : boolValue) {
		boolString.push_back(b ? '1' : '0');
	}
	if (memPtOfVar.count(boolString)) {
		return memPtOfVar[boolString];
	}
	uint s = state.size();
	for (bool b : boolValue) {
		state.push_back(b);
	}
	memPtOfVar[boolString] = s;
	return s;
}

inline Memory Memory::submem(uint pos, uint size) {
	return Memory(this->begin() + pos, this->begin() + pos + size);
}
inline uint Memory::toInt(uint pos, uint size) {
	uint v = 0;
	while (size) {
		v *= 2;
		v += (*this)[pos];
		pos += 1;
		size -= 1;
	}
	return v;
}

inline void Memory::fromInt(uint val) {
	for (int i = (int)this->size() - 1; i >= 0; i--, val /= 2) {
		(*this)[i] = val & 1;
	}
}

#endif // NETLIST_HPP
