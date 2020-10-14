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
	else if (opFlags & FLAG_RAM_WRITE) return "WRITE_RAM";
	else if (opFlags & FLAG_OP_RAM) return "RAM";
	else if (opFlags & FLAG_OP_ROM) return "ROM";
	else if (opFlags & FLAG_OP_SELECT) return "SELECT";
	else if (opFlags & FLAG_OP_SLICE) return "SLICE";
	else if (opFlags & FLAG_OP_CONCAT) return "CONCAT";
	else if (opFlags & FLAG_OP_NOT) return "NOT";
	else if (opFlags & FLAG_OP_MUX) return "MUX";
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
Arg::Arg(int n) {
	this->repr = "";
	type = ArgInt;
	intValue = n;
}


/*
	Soft netlist
*/

void SoftNetlist::checkVarArgs() {
	for (auto& p : variables) {
		Variable& var = p.second;

		// First, transform some operations
		if (var.operation == OpReg && var.args.size() && var.args[0].type == ArgBool) {
			var.operation = OpConst;
		}

		// TODO : check all variables refs, args types, size...
	}
}

std::vector<Variable> SoftNetlist::sorted() {
	std::map<std::string, int> nbParents;
	std::map<std::string, std::vector<std::string>> children;
	std::vector<Variable> sortedVars;
	std::deque<std::string> ontop;


	for (auto& p : variables) {
		children[p.second.name] = {};
	}

	for (auto& p : variables) {
		const Variable& var = p.second;
		nbParents[var.name] = 0;
		int iArg = 0;
		for (auto& arg : var.args) {
			if (var.operation == OpRam && iArg >= 3) {
				break; // The write part is always done at the end
			}
			if (arg.type == ArgVariable && var.operation != OpReg) {
				nbParents[var.name] += 1;
				children[arg.repr].push_back(var.name);
			}
			iArg++;
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

void Memory::extend_by(int n) {
	this->resize(this->size() + n, 0);
}

void Memory::set_size_min(int n) {
	if ((int)this->size() < n) {
		this->resize(n, 0);
	}
}
inline Memory Memory::submem(int pos, int size) {
	return Memory(this->begin() + pos, this->begin() + pos + size);
}
inline int Memory::toInt(int pos, int size) {
	int v = 0;
	while (size) {
		v *= 2;
		v += (*this)[pos];
		pos += 1;
		size -= 1;
	}
	return v;
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

inline void copyFrom(const Memory& memFrom, const int ptFrom, Memory& memTo, const int ptTo, const int n) {
	std::copy(memFrom.begin() + ptFrom, memFrom.begin() + ptFrom + n, memTo.begin() + ptTo);
}

NetlistSim::NetlistSim(SoftNetlist& net) {
	// Sort all variables
	net.checkVarArgs();
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, int> memPtOfVar, idOfVar;

	nbRegistersOp = 0;
	int iVarInAllVars = 0;
	for (Variable& var : allvars) { // Initialize the memory
		var.pos = state.size();
		memPtOfVar[var.name] = var.pos;
		idOfVar[var.name] = iVarInAllVars++;
		state.extend_by(var.size);

		if (var.operation == OpReg) {
			nbRegistersOp++;
			registers.extend_by(var.size);
		}
		if (var.operation == OpRam) {
			var.args.insert(var.args.begin(), Arg(ram.size())); // First arg : ram block id
			int maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			ram.extend_by(maxSize);
		}
		if (var.operation == OpRom) {
			var.args.insert(var.args.begin(), Arg(rom.size())); // First arg : rom block id
			int maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			rom.extend_by(maxSize);
		}
		// std::cout << var << "\n";
	}

	// Create the write RAM operations
	std::vector<Variable> ramVars;
	for (Variable& var : allvars) {
		if (var.operation == OpRam) {
			Variable varWrite = Variable{ "", OpRamWrite, 0, (int)state.size(), {} };
			// Create the write operation
			varWrite.args.push_back(var.args[0]); // ram block starts at
			varWrite.args.push_back(var.args[1]); // addr_size
			varWrite.args.push_back(var.args[2]); // word_size
			varWrite.args.push_back(var.args[4]); // write_enable
			varWrite.args.push_back(var.args[5]); // write_addr
			varWrite.args.push_back(var.args[6]); // write_data
			ramVars.push_back(varWrite);

			// Remove the write parameters from the RAM read operation
			var.args.pop_back(); var.args.pop_back(); var.args.pop_back();
		}
	}

	// Initialize the operation vector
	allvars.insert(allvars.end(), ramVars.begin(), ramVars.end());
	for (Variable& var : allvars) {
		int operationId = (int)var.operation;
		int iVar = operations.size();

		if (var.operation == OpConst) { // ASSIGN : Store the value and discard the operation
			if (var.args[0].type == ArgBool) {
				int pos = var.pos;
				for (bool b : var.args[0].boolValue) {
					state[pos++] = b;
				}
			}
			else if (var.args[0].type == ArgVariable) {
				var.pos = memPtOfVar[var.args[0].repr]; // Will point to the variable
				memPtOfVar[var.name] = var.pos;
			}
			else {
				throw UsageError("A const assignement can't take the value of another variable");
			}
			continue;
		}

		if (var.operation != OpReg) { // Unused for REG operations
			operations.push_back(0); // Will be replace by the operation flags
		}
		operations.push_back(var.pos); // Memory address in 'state' of the variable

		// Store args
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
				operationId |= (FLAG_PARAM_0_CST << iArg);
			}
		}

		if (var.operation == OpReg) {
			operations.push_back(sizeOfArg(var.args[0], idOfVar, allvars));
		}
		else {
			operations[iVar] = operationId; // Set operation flags
		}
		if (var.operation == OpConcat) {
			operations.push_back(sizeOfArg(var.args[0], idOfVar, allvars));
			operations.push_back(sizeOfArg(var.args[1], idOfVar, allvars));
		}
		if (var.operation == OpMux) {
			operations.push_back(sizeOfArg(var.args[1], idOfVar, allvars));
			if (sizeOfArg(var.args[2], idOfVar, allvars) != operations.back()) {
				throw UsageError("MUX operands doesn't have the same size");
			}
		}
	}

	// hasBeenExecuted.resize(operations.size(), false);

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

void NetlistSim::writeRom(const Memory& mem) {
	rom.set_size_min(mem.size());
	std::copy(mem.begin(), mem.end(), rom.begin());
}

void NetlistSim::setInputs(const Memory& mem) {
	int memPt = 0;
	for (HardVariable& var : inputs) {
		copyFrom(mem, memPt, state, var.memoryPt, var.size);
		memPt += var.size;
	}
}
void NetlistSim::setInputsSplit(const std::vector<Memory>& inputValues) {
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
		outs[iOutput] = Memory(state.begin() + pt, state.begin() + pt + outputs[iOutput].size);
	}
	return outs;
}

/*
	The simulation
*/

#define FLAG_MEM(flag, N) (flag & (FLAG_PARAM_0_CST << N) ? constants : state)
const int regOpBlocks = 3;

void NetlistSim::cycle() {
	int curOp = nbRegistersOp * regOpBlocks; // Skip the registers

	// for (int v : operations) {
	// 	std::cout << strOfOp(v) << " " << v << "\n";
	// }

	// Copy all registers
	std::copy(registers.begin(), registers.end(), state.begin());

	// Run all other operations
	while (curOp < (int)operations.size()) {
		int nbArgs = 0;
		int opFlags = operations[curOp];
		int statePt = operations[curOp + 1];


		// std::cout << "\n============ " << curOp << " / " << operations.size() << "  " << strOfOp(opFlags) << "\n";
		curOp += 2; // [op] [mem cell]

		if (opFlags & FLAG_BIN_OPS) {
			nbArgs = 2; // [left] [right]
			bool b1 = FLAG_MEM(opFlags, 0)[operations[curOp]];
			bool b2 = FLAG_MEM(opFlags, 1)[operations[curOp + 1]];

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
		else if (opFlags & FLAG_OP_NOT) {
			nbArgs = 2; // [operand] [size]
			state[statePt] = !FLAG_MEM(opFlags, 0)[operations[curOp]];
		}
		else if (opFlags & FLAG_BUS_OPS) {
			if (opFlags & FLAG_OP_SELECT) {
				nbArgs = 2; // [id (int)] [operand (bus)]
				state[statePt] = FLAG_MEM(opFlags, 1)[operations[curOp] + operations[curOp + 1]];
			}
			else if (opFlags & FLAG_OP_CONCAT) {
				nbArgs = 4; // [bus 1] [bus 2] [size 1] [size 2]
				copyFrom(FLAG_MEM(opFlags, 0), operations[curOp + 0], state,
					statePt, operations[curOp + 2]);
				copyFrom(FLAG_MEM(opFlags, 1), operations[curOp + 1], state,
					statePt + operations[curOp + 2], operations[curOp + 3]);
			}
			else if (opFlags & FLAG_OP_SLICE) {
				nbArgs = 3; // [id start] [id end (inclus)] [operand (bus)]
				copyFrom(FLAG_MEM(opFlags, 2), operations[curOp] + operations[curOp + 2], state,
					statePt, operations[curOp + 1] - operations[curOp] + 1);
			}
		}
		else if (opFlags & FLAG_OP_MUX) {
			nbArgs = 4; // [control bit] [left] [right] [size (of left and right)]
			if (FLAG_MEM(opFlags, 0)[operations[curOp]]) {
				copyFrom(FLAG_MEM(opFlags, 2), operations[curOp + 2], state,
					statePt, operations[curOp + 3]);
			}
			else {
				copyFrom(FLAG_MEM(opFlags, 1), operations[curOp + 1], state,
					statePt, operations[curOp + 3]);
			}
		}
		else if (opFlags & FLAG_OP_RAM) {
			// nbArgs = 7; // [block start at] [addr_size:int] [word_size:int] [read_addr:bus] [write_enable:bit] [write_addr:bus] [write_data:bus]
			if (opFlags & FLAG_RAM_WRITE) {
				nbArgs = 6; // [block start at] [addr_size:int] [word_size:int] [write_enable:bit] [write_addr:bus] [write_data:bus]

				if (FLAG_MEM(opFlags, 3)[operations[curOp + 3]]) {
					int writeAddr = FLAG_MEM(opFlags, 4).toInt(operations[curOp + 4],
						operations[curOp + 1]);

					copyFrom(FLAG_MEM(opFlags, 5), operations[curOp + 5], ram,
						operations[curOp] + writeAddr, operations[curOp + 2]);
				}
			}
			else {
				nbArgs = 4; // [block start at] [addr_size:int] [word_size:int] [read_addr:bus]
				int readAddr = FLAG_MEM(opFlags, 3).toInt(operations[curOp + 3],
					operations[curOp + 1]);
				copyFrom(ram, operations[curOp] + readAddr, state, statePt, operations[curOp + 2]);
			}
		}
		else if (opFlags & FLAG_OP_ROM) {
			nbArgs = 4; // [block start at] [addr_size:int] [word_size:int] [read_addr:bus]
			int readAddr = FLAG_MEM(opFlags, 3).toInt(operations[curOp + 3],
				operations[curOp + 1]);
			copyFrom(rom, operations[curOp] + readAddr, state, statePt, operations[curOp + 2]);
		}
		else {
			throw UsageError("Unknown operation");
		}
		curOp += nbArgs; //  [args...]
		// std::cout << "done\n";
	}

	// End with registers (for the next cycle). Operations : [flags (unused)] [memory pt] [operand] [size]
	curOp = 0;
	for (int iRegister = 0; iRegister < nbRegistersOp; iRegister++, curOp += regOpBlocks) {
		int statePt = operations[curOp];
		copyFrom(state, operations[curOp + 1],
			registers, statePt, operations[curOp + 2]);
	}
}
