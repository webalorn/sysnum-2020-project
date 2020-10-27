#include <string>
#include <deque>
#include <algorithm>
#include "recnetlist.hpp"
#include "../util/exceptions.hpp"


inline uint opIndexOfConst(Memory& state, std::vector<uint>& operations,
	std::map<std::string, uint>& memPtOfVar,
	std::map<std::string, uint>& opPosOfVar, const Memory& boolValue) {

	std::string boolString = "";
	for (bool b : boolValue) {
		boolString.push_back(b ? '1' : '0');
	}
	if (opPosOfVar.count(boolString)) {
		return opPosOfVar[boolString];
	}
	memPtOfVar[boolString] = state.size();
	opPosOfVar[boolString] = operations.size();
	for (bool b : boolValue) {
		state.push_back(b);
	}
	operations.push_back(0);
	operations.push_back(memPtOfVar[boolString]);

	return opPosOfVar[boolString];
}

/*
	Netlist simulator (~ hard netlist)
*/

const int regOpBlocks = 4;

RecNetlistSim::RecNetlistSim(SoftNetlist& net) {
	this->init(net);
}
RecNetlistSim::RecNetlistSim() {}

void RecNetlistSim::init(SoftNetlist& net) {
	// Sort all variables
	net.checkVarArgs();
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, uint> memPtOfVar, idOfVar, opPosOfVar;

	nbRegistersOp = 0;
	uint iVarInAllVars = 0;

	for (Variable& var : allvars) { // Initialize the ROM first
		if (var.operation == OpRom) {
			var.args.insert(var.args.begin(), Arg(rom.size())); // First arg : rom block id
			uint maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			ram.extend_by(maxSize);
		}
	}
	for (Variable& var : allvars) { // Initialize the memory

		var.pos = state.size();
		memPtOfVar[var.name] = var.pos;
		idOfVar[var.name] = iVarInAllVars++;
		state.extend_by(var.size);
		// TODO : slice & select
		// if (var.operation != OpSlice && var.operation != OpSelect) {
		// 	state.extend_by(var.size);
		// }

		if (var.operation == OpReg) {
			nbRegistersOp++;
			registers.extend_by(var.size);
		}
		if (var.operation == OpRam) {
			var.args.insert(var.args.begin(), Arg(ram.size())); // First arg : ram block id
			uint maxSize = (1 << var.args[1].intValue) + var.args[2].intValue;
			ram.extend_by(maxSize);
		}
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
		// if (var.operation == OpConst) { // TODO : ASSIGN : Store the value and discard the operation
		// 	if (var.args[0].type == ArgBool) {
		// 		uint pos = var.pos;
		// 		for (bool b : var.args[0].boolValue) {
		// 			state[pos++] = b;
		// 		}
		// 	}
		// 	else if (var.args[0].type == ArgVariable) {
		// 		var.pos = memPtOfVar[var.args[0].repr]; // Will point to the variable
		// 		memPtOfVar[var.name] = var.pos;
		// 	}
		// 	else {
		// 		throw UsageError("A const assignement can't take the value of another variable");
		// 	}
		// 	continue;
		// }

		// Store constant args
		for (uint iArg = 0; iArg < var.args.size(); iArg++) {
			auto& arg = var.args[iArg];
			if (arg.type == ArgBool) {
				uint i = opIndexOfConst(state, operations, memPtOfVar, opPosOfVar, arg.boolValue);
				arg.intValue = i;
			}
		}

		uint opId = operations.size();
		opPosOfVar[var.name] = opId;
		// if (var.operation != OpReg) { // Unused for REG operations
		operations.push_back(var.operation);
		// }
		operations.push_back(var.pos); // Memory address in 'state' of the variable

		// Store args
		for (uint iArg = 0; iArg < var.args.size(); iArg++) {
			auto& arg = var.args[iArg];
			if (arg.type == ArgVariable) {
				// operations.push_back(memPtOfVar[arg.repr]);
				if (var.operation != OpReg) {
					operations.push_back(opPosOfVar[arg.repr]);
				}
				else { // Because opPosOfVar is not initialized yet
					operations.push_back(idOfVar[arg.repr]);
				}
			}
			else {
				operations.push_back(arg.intValue); // Int or bool address
			}
		}

		// if (var.operation == OpSelect) { // Remove Select operations
		// 	uint blockPt = operations.back(); operations.pop_back();
		// 	uint i = operations.back(); operations.pop_back();
		// 	operations.pop_back(); operations.pop_back(); // id and mem pt

		// 	var.pos = blockPt + i;
		// 	memPtOfVar[var.name] = var.pos;
		// }

		// if (var.operation == OpSlice) { // Remove Slice operations
		// 	uint blockPt = operations.back(); operations.pop_back();
		// 	operations.pop_back(); // j
		// 	uint i = operations.back(); operations.pop_back();
		// 	operations.pop_back(); operations.pop_back(); // id and mem pt

		// 	var.pos = blockPt + i;
		// 	memPtOfVar[var.name] = var.pos;
		// }

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

		if (var.operation == OpConst && var.args[0].type == ArgBool) {
			std::copy(var.args[0].boolValue.begin(), var.args[0].boolValue.end(),
				state.begin() + operations[opId + 1]);
			operations.push_back(0);
		}
		else if (var.operation == OpConst) {
			operations.push_back(var.size);
		}

		hasBeenExecuted.resize(operations.size(), true);
		if (var.operation != OpReg) {
			hasBeenExecuted[opId] = false;
		}
		// std::cerr << "Operation " << var.name << " type " << strOfOp(var.operation)
		// 	<< " at " << opId << " stored at " << var.pos << "\n";
	}

	for (uint iRegister = 0; iRegister < nbRegistersOp; iRegister++) {
		auto varname = allvars[operations[iRegister * regOpBlocks + 2]].name;
		operations[iRegister * regOpBlocks + 2] = opPosOfVar[varname];
	}


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

/*
	The simulation
*/

#define ARG_VAL(i) state[operations[operations[i]+1]]
#define ARG_ADDR(i) operations[operations[i]+1]
#define ARG_OP(i) operations[i]

void RecNetlistSim::cycle(uint nbCycles) {
	uint nbOperations = operations.size();
	for (uint iCycle = 0; iCycle != nbCycles; iCycle++) {
		this->onCycleBegin(iCycle);
		uint curOp = nbRegistersOp * regOpBlocks; // Skip the registers

		// std::cerr << "\n\n============= Cycle " << iCycle << "=============\n";
		// std::cerr << state << "\n";
		// std::cerr << registers << "\n";

		// for (uint v : operations) {
		// 	std::cerr << strOfOp(v) << " " << v << "\n";
		// }

		// std::cerr << this->rom.submem(0, 128) << "\n";
		// Copy all registers
		std::copy(registers.begin(), registers.end(), state.begin());

		// Run all other operations
		while (curOp < nbOperations) {
			uint opFlags = operations[curOp];
			if (opFlags == 0) { // Constant Value
				curOp += 2;
				continue;
			}

			uint statePt = operations[curOp + 1];
			uint nbArgs = 0;

			// std::cerr << "\n------- " << curOp << " / "
			// 	<< operations.size() << "  " << strOfOp(opFlags)
			// 	<< " at " << statePt << "\n";

			curOp += 2; // [op] [mem cell]

			if (opFlags & FLAG_BIN_OPS) {
				nbArgs = 2; // [left] [right]
				bool b1 = ARG_VAL(curOp);
				bool b2 = ARG_VAL(curOp + 1);
				// std::cerr << (uint)b1 << " " << (uint)b2 << "\n";

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
					state[statePt] = !ARG_VAL(curOp);
					break;

				case FLAG_OP_CONCAT:
					nbArgs = 4; // [bus 1] [bus 2] [size 1] [size 2]
					copyFrom(state, ARG_ADDR(curOp + 0), state,
						statePt, operations[curOp + 2]);
					copyFrom(state, ARG_ADDR(curOp + 1), state,
						statePt + operations[curOp + 2], operations[curOp + 3]);
					break;

				case FLAG_OP_SELECT:
					nbArgs = 2; // [i] [bus addr]
					state[statePt] = state[ARG_ADDR(curOp + 1) + operations[curOp + 0]];
					break;

				case FLAG_OP_SLICE:
					nbArgs = 3; // [i] [j] [bus addr]
					copyFrom(state, ARG_ADDR(curOp + 2) + operations[curOp + 0], state,
						statePt, operations[curOp + 1] - operations[curOp + 0] + 1);
					break;

				case FLAG_OP_CONST:
					nbArgs = 2; // [val] [size]
					if (operations[curOp + 1]) {
						copyFrom(state, ARG_ADDR(curOp), state,
							statePt, operations[curOp + 1]);
					}
					break;

				case FLAG_OP_MUX:
					nbArgs = 4; // [control bit] [left] [right] [size (of left and right)]
					if (ARG_VAL(curOp)) {
						copyFrom(state, ARG_ADDR(curOp + 2), state,
							statePt, operations[curOp + 3]);
					}
					else {
						copyFrom(state, ARG_ADDR(curOp + 1), state,
							statePt, operations[curOp + 3]);
					}
					break;

				case FLAG_RAM_WRITE:
					nbArgs = 6; // [block start at] [addr_size:uint] [word_size:uint] [write_enable:bit] [write_addr:bus] [write_data:bus]
					if (ARG_VAL(curOp + 3)) {
						addr = state.toInt(ARG_ADDR(curOp + 4),
							operations[curOp + 1]);

						copyFrom(state, ARG_ADDR(curOp + 5), ram,
							operations[curOp] + addr, operations[curOp + 2]);
					}
					break;

				case FLAG_OP_RAM:
					nbArgs = 4; // [block start at] [addr_size:uint] [word_size:uint] [read_addr:bus]
					addr = state.toInt(ARG_ADDR(curOp + 3),
						operations[curOp + 1]);
					copyFrom(ram, operations[curOp] + addr, state, statePt, operations[curOp + 2]);
					break;

				case FLAG_OP_ROM:
					nbArgs = 4; // [block start at] [addr_size:uint] [word_size:uint] [read_addr:bus]
					addr = state.toInt(ARG_ADDR(curOp + 3),
						operations[curOp + 1]);
					copyFrom(rom, operations[curOp] + addr, state, statePt, operations[curOp + 2]);
					break;
				default:
					throw UsageError("Unknown operation");
				}
			}
			curOp += nbArgs; //  [args...]
			// std::cerr << state << "\n";
			// std::cout << "done\n";
		}

		// End with registers (for the next cycle). Operations : [flags (unused)] [memory pt] [operand] [size]
		curOp = 0;
		for (uint iRegister = 0; iRegister < nbRegistersOp; iRegister++, curOp += regOpBlocks) {
			// std::cerr << "Register " << iRegister << " reg " << operations[curOp + 1]
			// 	<< " save op " << operations[curOp + 2] << " of size " << operations[curOp + 3] << "\n";
			uint statePt = operations[curOp + 1];
			copyFrom(state, ARG_ADDR(curOp + 2),
				registers, statePt, operations[curOp + 3]);
		}


		try {
			this->onCycleEnd(iCycle);
		}
		catch (StopCycling) {
			break;
		}
	}
}
