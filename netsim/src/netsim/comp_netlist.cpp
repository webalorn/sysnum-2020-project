#include <string>
#include <deque>
#include <algorithm>
#include <ostream>
#include "netlist.hpp"
#include "../util/exceptions.hpp"

/*
	Netlist generator
*/

std::map<std::string, uint> idOpOfVar;

std::string reprOfArg(Arg& arg, int i, std::map<std::string, uint>& memPtOfVar) {
	if (arg.type == ArgBool) {
		return arg.boolValue[i] ? "1" : "0";
	}
	else if (arg.type == ArgInt) {
		return std::to_string((int)arg.intValue);
	}
	else {
		uint varPos = memPtOfVar[arg.repr];
		return "state[" + std::to_string((int)(varPos + i)) + "]";
	}
}

#define REPR(arg, i) ((reprOfArg(arg, i, memPtOfVar)))

bool isMemeZero(Memory& mem) {
	for (bool b : mem) {
		if (b) {
			return false;
		}
	}
	return true;
}

void copyArg(std::ostream& os, std::map<std::string, uint>& memPtOfVar,
	uint destPos, Arg& sourceArg, uint size, uint destOffset = 0) {

	if (sourceArg.type == ArgVariable) {
		uint varPos = memPtOfVar[sourceArg.repr];
		os << "std::copy(state.begin() + " << varPos << ", state.begin() + "
			<< varPos + size << ", state.begin() + " << destPos + destOffset << ");\n";
	}
	else if (sourceArg.type == ArgBool && size <= 100 && isMemeZero(sourceArg.boolValue)) {
		os << "std::copy(zerobits.begin(), zerobits.begin() + " << size
			<< ", state.begin() + " << destPos + destOffset << ");\n";
	}
	else {
		for (uint i = 0; i < size; i++) {
			os << "state[" << destPos + i + destOffset << "] = " << REPR(sourceArg, i) << ";\n";
		}
	}
}

void genNetlistCode(SoftNetlist& net, std::ostream& os) {
	// Sort all variables
	net.checkVarArgs();
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, uint> memPtOfVar, idOfVar;
	uint sizeState = 0, sizeRam = 0, nbRegistersOp = 0, sizeRegs = 0;


	uint iVarInAllVars = 0;
	for (Variable& var : allvars) { // Initialize the ROM before
		if (var.operation == OpRom) {
			var.args.insert(var.args.begin(), Arg(sizeRam)); // First arg : rom block id
			sizeRam += (1 << var.args[1].intValue) + var.args[2].intValue;
		}
	}
	for (Variable& var : allvars) { // Initialize the memory
		var.pos = sizeState;
		memPtOfVar[var.name] = var.pos;
		idOfVar[var.name] = iVarInAllVars++;
		if (var.operation != OpSlice && var.operation != OpSelect) {
			sizeState += var.size;
		}

		if (var.operation == OpReg) {
			nbRegistersOp++;
			sizeRegs += var.size;
		}
		if (var.operation == OpRam) {
			var.args.insert(var.args.begin(), Arg(sizeRam)); // First arg : rom block id
			sizeRam += (1 << var.args[1].intValue) + var.args[2].intValue;
		}
		// std::cout << var << "\n";
	}

	// Create the write RAM operations
	std::vector<Variable> ramVars;
	for (Variable& var : allvars) {
		if (var.operation == OpRam) {
			Variable varWrite = Variable{ "", OpRamWrite, 0, sizeState, {} };
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
	allvars.insert(allvars.end(), ramVars.begin(), ramVars.end());

	/* Optimize operations */
	std::map<std::string, uint> nbDependOf;
	int iOpCur = 0;
	for (Variable& var : allvars) {
		nbDependOf[var.name] = 0;
		idOpOfVar[var.name] = iOpCur++;
	}
	for (Variable& var : allvars) {
		for (Arg& arg : var.args) {
			if (arg.type == ArgVariable) {
				nbDependOf[arg.repr] += 1;
			}
		}
	}
	// Optimize concats
	for (Variable& var : allvars) {
		if (var.operation == OpConcat) {
			std::vector<Arg> concatArgs;
			for (Arg& arg : var.args) {
				if (arg.type == ArgVariable && allvars[idOpOfVar[arg.repr]].operation == OpConcat) {
					nbDependOf[arg.repr] -= 1;
					for (Arg& arg2 : allvars[idOpOfVar[arg.repr]].args) {
						concatArgs.push_back(arg2);
					}
				}
				else {
					concatArgs.push_back(arg);
				}
			}
			var.args = concatArgs;
		}
	}


	/* Create the init function */

	os << "#import \"../src/netsim/comp_netlist_sim.hpp\"\n\n";

	os << "void NetsimCompRunner::init() {\n";
	uint inputSize = 0;
	for (std::string inName : net.inputs) {
		auto& var = net.variables[inName];
		uint memPt = memPtOfVar[inName];
		os << "inputs.push_back(HardVariable{ \"" << inName
			<< "\", " << var.size << ", " << memPt << " });\n";
		inputSize += var.size;
	}
	uint outputSize = 0;
	for (std::string outName : net.outputs) {
		auto& var = net.variables[outName];
		uint memPt = memPtOfVar[outName];
		os << "outputs.push_back(HardVariable{ \"" << outName
			<< "\", " << var.size << ", " << memPt << " });\n";
		outputSize += var.size;
	}
	os << "inputSize = " << inputSize << ";\n";
	os << "outputSize = " << outputSize << ";\n";
	os << "\n";
	os << "state.resize(" << sizeState << ", 0);\n";
	os << "ram.resize(" << sizeRam << ", 0);\n";
	os << "registers.resize(" << sizeRegs << ", 0);\n";
	os << "}\n\n";

	/* Create the run function */

	// Initialize the operation vector

	os << "void NetsimCompRunner::cycle(uint nbCycles) {\n";
	os << "uint addr;\n";
	os << "\n";

	// Init constants
	os << "// Init constants\n";
	os << "Memory zerobits(100, 0);\n";
	for (Variable& var : allvars) {
		if (var.operation == OpConst && var.args[0].type == ArgBool) {
			copyArg(os, memPtOfVar, var.pos, var.args[0], var.size);
		}
	}

	// Main loop
	os << "\nfor (uint iCycle = 0; nbCycles == 0 || iCycle < nbCycles; iCycle++) {\n";
	os << "onCycleBegin(iCycle);\n";
	os << "std::copy(registers.begin(), registers.end(), state.begin());\n";


	for (Variable& var : allvars) {
		os << "// " << var.name << " = " << strOfOp(var.operation);
		for (Arg& a : var.args) {
			os << " [" << a.repr << "]";
		}
		os << "\n";

		if (var.operation == OpSelect) { // Remove Select operations
			uint blockPt = memPtOfVar[var.args[1].repr];
			blockPt += var.args[0].intValue;

			var.pos = blockPt;
			memPtOfVar[var.name] = blockPt;
		}
		else if (var.operation == OpSlice) { // Remove Slice operations
			uint blockPt = memPtOfVar[var.args[2].repr];
			blockPt += var.args[0].intValue;

			var.pos = blockPt;
			memPtOfVar[var.name] = blockPt;
		}
		else if (var.operation == OpConst && var.args[0].type != ArgBool) {
			copyArg(os, memPtOfVar, var.pos, var.args[0], var.size);
		}
		else if (var.operation == OpConcat) {
			if (nbDependOf[var.name] > 0) {
				uint sizePrev = 0;
				for (Arg& arg : var.args) {
					uint sizeArg = sizeOfArg(arg, idOfVar, allvars);
					copyArg(os, memPtOfVar, var.pos, arg, sizeArg, sizePrev);
					sizePrev += sizeArg;
				}
			}
		}
		else if (var.operation & FLAG_BIN_OPS) {
			os << "state[" << var.pos << "] = ";
			if (var.operation == OpOr) {
				os << REPR(var.args[0], 0) << " || " << REPR(var.args[1], 0);
			}
			else if (var.operation == OpAnd) {
				os << REPR(var.args[0], 0) << " && " << REPR(var.args[1], 0);
			}
			else if (var.operation == OpXor) {
				os << REPR(var.args[0], 0) << " != " << REPR(var.args[1], 0);
			}
			else if (var.operation == OpNand) {
				os << "!(" << REPR(var.args[0], 0) << " && " << REPR(var.args[1], 0) << ")";
			}
			os << ";\n";
		}
		else if (var.operation == OpNot) {
			os << "state[" << var.pos << "] = !" << REPR(var.args[0], 0) << ";\n";
		}
		else if (var.operation == OpMux) {
			os << "if (" << REPR(var.args[0], 0) << ") {\n";
			copyArg(os, memPtOfVar, var.pos, var.args[2], var.size);
			os << "} else {\n";
			copyArg(os, memPtOfVar, var.pos, var.args[1], var.size);
			os << "}\n";
		}
		else if (var.operation == OpRam || var.operation == OpRom || var.operation == OpRamWrite) {
			int blockStart = var.args[0].intValue;
			int iAddr = var.operation == OpRamWrite ? 4 : 3;
			for (uint i = 0; i < var.args[1].intValue; i++) {
				if (i == 0) {
					os << "addr = " << REPR(var.args[iAddr], i) << ";\n";
				}
				else {
					os << "addr = (addr << 1) + " << REPR(var.args[iAddr], i) << ";\n";
				}
			}

			if (var.operation == OpRam || var.operation == OpRom) {
				os << "std::copy(ram.begin() + addr + " << blockStart << ", ram.begin() + addr +"
					<< blockStart + var.args[2].intValue << ", state.begin() + "
					<< var.pos << ");\n";
			}
			else {
				os << "if (" << REPR(var.args[3], 0) << ") {\n";
				for (uint i = 0; i < var.args[2].intValue; i++) {
					os << "    ram[addr + " << (blockStart + i) << "] = " << REPR(var.args[5], i) << ";\n";
				}
				os << "}\n";
			}
		}
		else if (var.operation != OpReg && var.operation != OpConst) {
			throw UsageError("Unknwown operation");
		}
	}
	uint curPos = 0;
	for (uint iRegister = 0; iRegister < nbRegistersOp; iRegister++) {
		Variable& var = allvars[iRegister];
		uint registeredPt = memPtOfVar[var.args[0].repr];
		os << "std::copy(state.begin() + " << registeredPt << ", state.begin() + "
			<< (registeredPt + var.size) << ", registers.begin() + " << curPos << ");\n";
		curPos += var.size;
	}
	os << "\n";
	os << "try {\n";
	os << "    this->onCycleEnd(iCycle);\n";
	os << "} catch (StopCycling) {\n";
	os << "    break;\n";
	os << "}\n}\n}\n";
}
