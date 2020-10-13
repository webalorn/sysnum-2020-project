#include <string>
#include <deque>
#include <algorithm>
#include <bitset> // For debug
#include "netlist.hpp"
#include "../exceptions.hpp"

std::string strOfOp(int opFlags) {
	if (opFlags & FLAG_OP_CONST) return "ASSIGN";
	else if (opFlags & FLAG_OP_OR) return "OR";
	else if (opFlags & FLAG_OP_XOR) return "XOR";
	else if (opFlags & FLAG_OP_AND) return "AND";
	else if (opFlags & FLAG_OP_NAND) return "NAND";
	else if (opFlags & FLAG_OP_REG) return "REG";
	else if (opFlags & FLAG_OP_RAM) return "RAM";
	else if (opFlags & FLAG_OP_ROM) return "ROM";
	else if (opFlags & FLAG_OP_SELECT) return "SELECT";
	else if (opFlags & FLAG_OP_SLICE) return "SLICE";
	else if (opFlags & FLAG_OP_CONCAT) return "CONCAT";
	return "????";
}

std::ostream& operator<<(std::ostream& os, const Variable& var) {
	os << var.name << " : " << var.size << " = ";
	os << strOfOp(var.operation);
	for (const Arg& a : var.args) {
		os << " " << a.repr;
	}
	return os;
}

Arg::Arg(std::string repr, bool isInt) {
	this->repr = repr;
	if (isInt) {
		intValue = stoi(repr);
		type = ArgInt;
	}
	else if (repr[0] == '0' || repr[0] == '1') {
		type = ArgBool;
		for (char& c : repr) {
			boolValue.push_back(c == '1' ? 1 : 0);
		}
	}
}


/*
	Soft netlist
*/


std::vector<Variable> SoftNetlist::sorted() {
	std::map<std::string, int> nbParents;
	std::map<std::string, std::vector<std::string>> children;
	std::vector<Variable> sortedVars;
	std::deque<std::string> ontop;


	for (auto& p : variables) {
		children[p.second.name] = {};
		std::cout << p.second.name << "\n";
	}

	for (auto& p : variables) {
		const Variable& var = p.second;
		nbParents[var.name] = 0;
		for (auto& arg : var.args) {
			if (arg.type == ArgVariable && var.operation != OpReg) {
				nbParents[var.name] += 1;
				children[arg.repr].push_back(var.name);
			}
		}
		if (var.operation == OpReg) {
			ontop.push_front(var.name);
		}
		else if (nbParents[var.name] == 0) {
			ontop.push_back(var.name);
		}
	}

	while (!ontop.empty()) {
		std::string cur = ontop.front();
		ontop.pop_front();
		sortedVars.push_back(variables[cur]);

		for (std::string child : children[cur]) {
			nbParents[child] -= 1;
			if (nbParents[child] == 0) {
				ontop.push_back(child);
			}
		}
	}

	if (sortedVars.size() != variables.size()) {
		throw UsageError("Cycle dependencies");
	}

	return sortedVars;
}


/*
	Memory manager
*/

void Memory::extend_by(size_t n) {
	this->resize(this->size() + n, 0);
}

void Memory::set_size_min(size_t n) {
	if (this->size() < n) {
		this->resize(n, 0);
	}
}
inline Memory Memory::submem(size_t pos, size_t size) {
	return Memory(this->begin() + pos, this->begin() + pos + size);
}

std::ostream& operator<<(std::ostream& os, const Memory& mem) {
	for (bool b : mem) {
		os << (int)b;
	}
	return os;
}


/*
	Netlist simulator (~ hard netlist)
*/

inline int sizeOfArg(const Arg& arg, std::map<std::string, int>& idOfVar,
	std::vector<Variable>& allvars) {
	if (arg.type == ArgVariable) {
		return allvars[idOfVar[arg.repr]].size;
	}
	if (arg.type == ArgInt) {
		throw UsageError("ArgInt doesn't have a size");
	}
	return arg.repr.size();
}

inline void copyFrom(Memory& memFrom, const int ptFrom, Memory& memTo, const int ptTo, const int n) {
	std::copy(memFrom.begin() + ptFrom, memFrom.begin() + ptFrom + n, memTo.begin() + ptTo);
}


NetlistSim::NetlistSim(SoftNetlist& net) {
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, int> memPtOfVar, idOfVar;

	nbRegistersOp = 0;
	int iVar = 0;
	for (Variable& var : allvars) { // Initialize the memory
		var.pos = state.size();
		memPtOfVar[var.name] = var.pos;
		idOfVar[var.name] = iVar++;
		state.extend_by(var.size);

		if (var.operation == OpReg) {
			nbRegistersOp++;
		}
		if (var.operation == OpRam) {
			ram.set_size_min(1 << var.args[0].intValue);
		}
		if (var.operation == OpRom) {
			rom.set_size_min(1 << var.args[0].intValue);
		}
		std::cout << var << "\n";
	}

	for (Variable& var : allvars) { // Initialize the operation vector
		int operationId = (int)var.operation;
		int iVar = operations.size();
		operations.push_back(0);
		operations.push_back(var.pos);

		for (int iArg = 0; iArg < (int)var.args.size(); iArg++) {
			auto& arg = var.args[iArg];
			if (arg.type == ArgVariable) {
				operations.push_back(memPtOfVar[arg.repr]);
			}
			else if (arg.type == ArgInt) {
				operations.push_back(arg.intValue);
			}
			else {
				operations.push_back(constants.size());
				for (bool b : arg.boolValue) {
					constants.push_back(b);
				}
				operationId |= (FLAG_PARAM_1_CST << iArg);
			}
		}

		if (var.operation == OpSelect) {
			operations.push_back(sizeOfArg(var.args[1], idOfVar, allvars));
		}
		if (var.operation == OpSlice) {
			operations.push_back(sizeOfArg(var.args[2], idOfVar, allvars));
		}
		if (var.operation == OpConcat) {
			operations.push_back(sizeOfArg(var.args[0], idOfVar, allvars));
			operations.push_back(sizeOfArg(var.args[1], idOfVar, allvars));
		}
		if (var.operation == OpReg) {
			operations.push_back(sizeOfArg(var.args[0], idOfVar, allvars));
		}
		if (var.operation == OpConst) {
			int constPt = operations.back();
			operations.pop_back(); // Don't put the value
			if (var.args[0].type != ArgBool) {
				throw UsageError("A const assignement can't take the value of another variable");
			}
			copyFrom(constants, constPt, state, operations.back(),
				sizeOfArg(var.args[0], idOfVar, allvars));
		}

		operations[iVar] = operationId;
	}

	hasBeenExecuted.resize(operations.size(), false);

	inputSize = 0;
	for (std::string inName : net.inputs) {
		auto& var = net.variables[inName];
		int memPt = memPtOfVar[inName];
		inputs.push_back(HardVariable{ inName, var.size, memPt });
		inputSize += var.size;
	}
	outputSize = 0;
	for (std::string outName : net.outputs) {
		auto& var = net.variables[outName];
		int memPt = memPtOfVar[outName];
		outputs.push_back(HardVariable{ outName, var.size, memPt });
		outputSize += var.size;
	}
}


int NetlistSim::getInputSize() {
	return inputSize;
}
int NetlistSim::getOutputSize() {
	return outputSize;
}
const std::vector<HardVariable>& NetlistSim::getInputsVar() {
	return inputs;
}
const std::vector<HardVariable>& NetlistSim::getOutputsVar() {
	return outputs;
}
Memory NetlistSim::getState() {
	return state;
}

void NetlistSim::setInputs(Memory& mem) {
	int memPt = 0;
	for (HardVariable& var : inputs) {
		copyFrom(mem, memPt, state, var.memoryPt, var.size);
		memPt += var.size;
	}
}
void NetlistSim::setInputsSplit(std::vector<Memory>& inputValues) {
	for (int iInput = 0; iInput < (int)inputValues.size(); iInput++) {
		copyFrom(inputValues[iInput], 0, state, inputs[iInput].memoryPt, inputs[iInput].size);
	}
}

Memory NetlistSim::getOutputs() {
	Memory mem(outputSize);
	int memPt = 0;
	for (HardVariable& var : outputs) {
		copyFrom(state, var.memoryPt, mem, memPt, var.size);
		memPt += var.size;
	}
	return mem;
}
std::vector<Memory> NetlistSim::getOutputsSplit() {
	std::vector<Memory> outs(outputs.size());
	for (int iOutput = 0; iOutput < (int)outputs.size(); iOutput++) {
		int pt = outputs[iOutput].memoryPt;
		outs[iOutput] = Memory(state.begin() + pt, state.begin() + pt + inputs[iOutput].size);
	}
	return outs;
}

/*
	The simulation
*/

inline bool NetlistSim::boolWithFlag(const int flagfilter, const int from) {
	return flagfilter ? constants[from] : state[from];
}

inline Memory NetlistSim::memWithFlag(const int flagfilter, const int from, const int size) {
	return flagfilter ? constants.submem(from, size)
		: state.submem(from, size);
}
inline void NetlistSim::copyWithFlag(const int flagfilter, const int from,
	const int dest, const int size) {
	if (flagfilter) {
		copyFrom(constants, from, state, dest, size);
	}
	else {
		copyFrom(state, from, state, dest, size);
	}
}


void NetlistSim::cycle() {
	size_t curOp = 0;

	// for (int v : operations) {
	// 	std::cout << strOfOp(v) << "\n";
	// }
	while (curOp < operations.size()) {
		int nbArgs = 0;
		int opFlags = operations[curOp];
		int statePt = operations[curOp + 1];


		// std::cout << "\n============ " << curOp << " / " << operations.size() << "  " << strOfOp(opFlags) << "\n";
		curOp += 2; // [op] [mem cell]

		if (opFlags & FLAG_BIN_OPS) {
			nbArgs = 2; // [left] [right]
			bool b1 = boolWithFlag(opFlags & FLAG_PARAM_1_CST, operations[curOp]);
			bool b2 = boolWithFlag(opFlags & FLAG_PARAM_2_CST, operations[curOp + 1]);
			if (opFlags & FLAG_OP_AND) {
				state[statePt] = b1 && b2;
			}
			else if (opFlags & FLAG_OP_NAND) {
				state[statePt] = !(b1 && b2);
			}
			else if (opFlags & FLAG_OP_OR) {
				state[statePt] = b1 || b2;
			}
			else if (opFlags & FLAG_OP_XOR) {
				state[statePt] = b1 != b2;
			}
		}
		else if (opFlags & FLAG_OP_REG) {
			nbArgs = 2; // [operand] [size]
			copyFrom(state, operations[operations[curOp] + 1],
				state, statePt, operations[curOp + 1]);
		}
		else if (opFlags & FLAG_BUS_OPS) {
			if (opFlags & FLAG_OP_SELECT) {
				nbArgs = 3; // [id (int)] [operand (bus)] [operand]
				// TODO
			}
			else if (opFlags & FLAG_OP_SLICE) {
				nbArgs = 4; // [id start] [id end (inclus)] [operand (bus)] [bus size]
				// TODO
			}
			else if (opFlags & FLAG_OP_CONCAT) {
				nbArgs = 4; // [bus 1] [bus 2] [size 1] [size 2]
				// TODO
			}
		}
		else if (opFlags & FLAG_OP_RAM) { // TODO
			nbArgs = 6; // [addr_size:int] [word_size:int] [read_addr:bus] [write_enable:bit] [write_addr:bus] [write_data:bus]
		}
		else if (opFlags & FLAG_OP_ROM) { // TODO
			nbArgs = 3; // [addr_size:int] [word_size:int] [read_addr:bus]
		}
		else if (opFlags & FLAG_OP_CONST) {
			nbArgs = 0;
			// copyWithFlag(opFlags & FLAG_PARAM_1_CST,
			//	operations[curOp], statePt, operations[curOp + 1]);
		}
		else {
			throw UsageError("Unknown operation");
		}
		curOp += nbArgs; //  [args...]
	}
}
