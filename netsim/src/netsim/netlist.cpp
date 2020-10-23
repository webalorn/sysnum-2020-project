#include <string>
#include <deque>
#include <algorithm>
#include "netlist.hpp"
#include "../util/exceptions.hpp"

std::string strOfOp(uint opFlags) {
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
Arg::Arg(uint n) {
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
	std::map<std::string, uint> nbParents;
	std::map<std::string, std::vector<std::string>> children;
	std::vector<Variable> sortedVars;
	std::deque<std::string> ontop;


	for (auto& p : variables) {
		children[p.second.name] = {};
	}

	for (auto& p : variables) {
		const Variable& var = p.second;
		nbParents[var.name] = 0;
		uint iArg = 0;
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

void Memory::extend_by(uint n) {
	this->resize(this->size() + n, 0);
}

void Memory::set_size_min(uint n) {
	if (this->size() < n) {
		this->resize(n, 0);
	}
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

std::ostream& operator<<(std::ostream& os, const Memory& mem) {
	for (bool b : mem) {
		os << b;
	}
	return os;
}


/*
	Netlist simulator (~ hard netlist)
*/

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

NetlistSim::NetlistSim(SoftNetlist& net) {
	this->init(net);
}
NetlistSim::NetlistSim() {}

void NetlistSim::init(SoftNetlist& net) {
	// Sort all variables
	net.checkVarArgs();
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, uint> memPtOfVar, idOfVar;

	nbRegistersOp = 0;
	uint iVarInAllVars = 0;
	for (Variable& var : allvars) { // Initialize the memory
		var.pos = state.size();
		memPtOfVar[var.name] = var.pos;
		idOfVar[var.name] = iVarInAllVars++;
		if (var.operation != OpSlice && var.operation != OpSelect) { // TODO : select
			state.extend_by(var.size);
		}

		if (var.operation == OpReg) {
			nbRegistersOp++;
			registers.extend_by(var.size);
		}
		if (var.operation == OpRam) {
			var.args.insert(var.args.begin(), Arg(ram.size())); // First arg : ram block id
			uint maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			ram.extend_by(maxSize);
		}
		if (var.operation == OpRom) {
			var.args.insert(var.args.begin(), Arg(rom.size())); // First arg : rom block id
			uint maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			rom.extend_by(maxSize);
		}
		// std::cout << var << "\n";
	}

	// Create the write RAM operations
	std::vector<Variable> ramVars;
	for (Variable& var : allvars) {
		if (var.operation == OpRam) {
			Variable varWrite = Variable{ "", OpRamWrite, 0, (uint)state.size(), {} };
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
		if (var.operation == OpConst) { // ASSIGN : Store the value and discard the operation
			if (var.args[0].type == ArgBool) {
				uint pos = var.pos;
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
			operations.push_back(var.operation);
		}
		operations.push_back(var.pos); // Memory address in 'state' of the variable

		// Store args
		for (uint iArg = 0; iArg < var.args.size(); iArg++) {
			auto& arg = var.args[iArg];
			if (arg.type == ArgVariable) {
				operations.push_back(memPtOfVar[arg.repr]);
			}
			else if (arg.type == ArgInt) {
				operations.push_back(arg.intValue);
			}
			else {
				uint i = indexOfConst(state, memPtOfVar, arg.boolValue);
				operations.push_back(i);
			}
		}

		if (var.operation == OpSelect) { // Remove Select operations
			uint blockPt = operations.back(); operations.pop_back();
			uint i = operations.back(); operations.pop_back();
			operations.pop_back(); operations.pop_back(); // id and mem pt

			var.pos = blockPt + i;
			memPtOfVar[var.name] = var.pos;
		}

		if (var.operation == OpSlice) { // Remove Select operations
			uint blockPt = operations.back(); operations.pop_back();
			operations.pop_back(); // j
			uint i = operations.back(); operations.pop_back();
			operations.pop_back(); operations.pop_back(); // id and mem pt

			var.pos = blockPt + i;
			memPtOfVar[var.name] = var.pos;
		}

		if (var.operation == OpReg) {
			operations.push_back(sizeOfArg(var.args[0], idOfVar, allvars));
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
		uint memPt = memPtOfVar[inName];
		inputs.push_back(HardVariable{ inName, var.size, memPt });
		inputSize += var.size;
	}
	outputSize = 0;
	for (std::string outName : net.outputs) {
		auto& var = net.variables[outName];
		uint memPt = memPtOfVar[outName];
		outputs.push_back(HardVariable{ outName, var.size, memPt });
		outputSize += var.size;
	}
}


uint NetlistSim::getInputSize() {
	return inputSize;
}
uint NetlistSim::getOutputSize() {
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
	uint memPt = 0;
	for (HardVariable& var : inputs) {
		copyFrom(mem, memPt, state, var.memoryPt, var.size);
		memPt += var.size;
	}
}
void NetlistSim::setInputsSplit(const std::vector<Memory>& inputValues) {
	for (uint iInput = 0; iInput < inputValues.size(); iInput++) {
		copyFrom(inputValues[iInput], 0, state, inputs[iInput].memoryPt, inputs[iInput].size);
	}
}

Memory NetlistSim::getOutputs() {
	Memory mem(outputSize);
	uint memPt = 0;
	for (HardVariable& var : outputs) {
		copyFrom(state, var.memoryPt, mem, memPt, var.size);
		memPt += var.size;
	}
	return mem;
}
std::vector<Memory> NetlistSim::getOutputsSplit() {
	std::vector<Memory> outs(outputs.size());
	for (uint iOutput = 0; iOutput < outputs.size(); iOutput++) {
		uint pt = outputs[iOutput].memoryPt;
		outs[iOutput] = Memory(state.begin() + pt, state.begin() + pt + outputs[iOutput].size);
	}
	return outs;
}

// inline void NetlistSim::onCycleBegin(uint) {
// 	std::cerr << "BEGIN\n";
// }
// inline void NetlistSim::onCycleEnd(uint) {}

/*
	The simulation
*/

const uint regOpBlocks = 3;

void NetlistSim::cycle(uint nbCycles) {
	uint nbOperations = operations.size();
	for (uint iCycle = 0; iCycle != nbCycles; iCycle++) {
		this->onCycleBegin(iCycle);
		uint curOp = nbRegistersOp * regOpBlocks; // Skip the registers

		// for (uint v : operations) {
		// 	std::cout << strOfOp(v) << " " << v << "\n";
		// }

		// std::cout << this->rom.submem(0, 128) << "\n";
		// Copy all registers
		std::copy(registers.begin(), registers.end(), state.begin());

		// Run all other operations
		while (curOp < nbOperations) {
			uint nbArgs = 0;
			uint opFlags = operations[curOp];
			uint statePt = operations[curOp + 1];


			// std::cout << "\n============ " << curOp << " / " << operations.size() << "  " << strOfOp(opFlags) << "\n";
			curOp += 2; // [op] [mem cell]

			if (opFlags & FLAG_BIN_OPS) {
				nbArgs = 2; // [left] [right]
				bool b1 = state[operations[curOp]];
				bool b2 = state[operations[curOp + 1]];

				switch (opFlags)
				{
				case FLAG_OP_AND:
					state[statePt] = b1 && b2;
					break;
				case FLAG_OP_NAND:
					state[statePt] = !(b1 && b2);
					break;
				case FLAG_OP_OR:
					state[statePt] = b1 || b2;
					break;
				case FLAG_OP_XOR:
					state[statePt] = b1 != b2;
					break;

				default:
					break;
				}
			}
			else {
				uint addr;
				switch (opFlags) {
				case FLAG_OP_NOT:
					nbArgs = 1; // [operand]
					state[statePt] = !state[operations[curOp]];
					break;

				case FLAG_OP_CONCAT:
					nbArgs = 4; // [bus 1] [bus 2] [size 1] [size 2]
					copyFrom(state, operations[curOp + 0], state,
						statePt, operations[curOp + 2]);
					copyFrom(state, operations[curOp + 1], state,
						statePt + operations[curOp + 2], operations[curOp + 3]);
					break;

				case FLAG_OP_MUX:
					nbArgs = 4; // [control bit] [left] [right] [size (of left and right)]
					if (state[operations[curOp]]) {
						copyFrom(state, operations[curOp + 2], state,
							statePt, operations[curOp + 3]);
					}
					else {
						copyFrom(state, operations[curOp + 1], state,
							statePt, operations[curOp + 3]);
					}
					break;

				case FLAG_RAM_WRITE:
					nbArgs = 6; // [block start at] [addr_size:uint] [word_size:uint] [write_enable:bit] [write_addr:bus] [write_data:bus]
					if (state[operations[curOp + 3]]) {
						addr = state.toInt(operations[curOp + 4],
							operations[curOp + 1]);

						copyFrom(state, operations[curOp + 5], ram,
							operations[curOp] + addr, operations[curOp + 2]);
					}
					break;

				case FLAG_OP_RAM:
					nbArgs = 4; // [block start at] [addr_size:uint] [word_size:uint] [read_addr:bus]
					addr = state.toInt(operations[curOp + 3],
						operations[curOp + 1]);
					copyFrom(ram, operations[curOp] + addr, state, statePt, operations[curOp + 2]);
					break;

				case FLAG_OP_ROM:
					nbArgs = 4; // [block start at] [addr_size:uint] [word_size:uint] [read_addr:bus]
					addr = state.toInt(operations[curOp + 3],
						operations[curOp + 1]);
					copyFrom(rom, operations[curOp] + addr, state, statePt, operations[curOp + 2]);
					break;
				default:
					throw UsageError("Unknown operation");
				}
			}
			curOp += nbArgs; //  [args...]
			// std::cout << "done\n";
		}

		// End with registers (for the next cycle). Operations : [flags (unused)] [memory pt] [operand] [size]
		curOp = 0;
		for (uint iRegister = 0; iRegister < nbRegistersOp; iRegister++, curOp += regOpBlocks) {
			uint statePt = operations[curOp];
			copyFrom(state, operations[curOp + 1],
				registers, statePt, operations[curOp + 2]);
		}

		try {
			this->onCycleEnd(iCycle);
		}
		catch (StopCycling) {
			break;
		}
	}
}
