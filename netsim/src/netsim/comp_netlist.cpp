#include <string>
#include <deque>
#include <algorithm>
#include <ostream>
#include <iostream>
#include "netlist.hpp"
#include "../util/exceptions.hpp"

/*
	Netlist generator
*/

std::map<std::string, uint> idOpOfVar;

std::string maskFor(VarPos& loc) {
	if (loc.size == 64) {
		return std::to_string(~(0ull)) + "ull";
	}
	return std::to_string((1ull << loc.size) - 1) + "ull";
}

std::string reprOfLoc(VarPos& loc) {
	if (loc.full) {
		return "var_" + std::to_string((int)(loc.pos)) + "";
	}
	else {
		std::string mask = maskFor(loc);
		return "((var_" + std::to_string((int)(loc.pos)) + " >> "
			+ std::to_string(loc.rightOffset) + ") & " + mask + ")";
	}
}

std::string reprOfArg(Arg& arg, std::map<std::string, VarPos>& locOfVar) {
	if (arg.type == ArgBool) {
		std::string s = "0b";
		for (bool c : arg.boolValue) {
			s.push_back(c ? '1' : '0');
		}
		return s + "ull";
	}
	else if (arg.type == ArgInt) {
		return std::to_string((int)arg.intValue);
	}
	else {
		VarPos& loc = locOfVar[arg.repr];
		return reprOfLoc(loc);
	}
}

#define REPR(arg) ((reprOfArg(arg, locOfVar)))

bool isMemZero(Memory& mem) {
	for (bool b : mem) {
		if (b) {
			return false;
		}
	}
	return true;
}

void copyArg(std::ostream& os, std::map<std::string, VarPos>& locOfVar,
	const VarPos& destLoc, Arg& sourceArg, uint destOffset = 0, bool orEq = false) {

	uint destPos = destLoc.pos;
	if (!destLoc.full) {
		exit(-1);
	}
	os << "var_" << destPos;
	os << (orEq ? " |= " : " = ");
	if (sourceArg.type == ArgBool && isMemZero(sourceArg.boolValue)) {
		os << "0ull";
	}
	else {
		os << REPR(sourceArg);
	}
	if (destOffset) {
		os << " << " << destOffset;
	}
	os << ";\n";
}

void genNetlistCode(SoftNetlist& net, std::ostream& os) {
	// Sort all variables
	net.checkVarArgs();
	std::vector<Variable> allvars = net.sorted();
	std::map<std::string, uint> idOfVar;
	std::map<std::string, VarPos> locOfVar;
	uint sizeState = 0, sizeRam = 0, nbRegistersOp = 0;
	uint iTransferTab = 0;


	uint iVarInAllVars = 0;
	for (Variable& var : allvars) { // Initialize the ROM before
		if (var.operation == OpRom) {
			var.args.insert(var.args.begin(), Arg(sizeRam)); // First arg : rom block id
			sizeRam += ((1 << var.args[1].intValue) + var.args[2].intValue) / 32 + 1;
		}
	}
	for (Variable& var : allvars) { // Initialize the memory
		var.loc = VarPos(sizeState, var.size);
		locOfVar[var.name] = var.loc;
		idOfVar[var.name] = iVarInAllVars++;

		if (var.operation != OpSlice && var.operation != OpSelect) {
			sizeState += 1;
		}

		if (var.operation == OpReg) {
			nbRegistersOp++;
		}
		if (var.operation == OpRam) {
			var.args.insert(var.args.begin(), Arg(sizeRam)); // First arg : ram block id
			sizeRam += ((1 << var.args[1].intValue) + var.args[2].intValue) / 32 + 1;
		}
	}

	// Create the write RAM operations
	for (Variable& var : allvars) {
		if (var.operation == OpRam) {
			Variable varWrite = Variable("", OpRamWrite, sizeState, {});
			// Create the write operation
			varWrite.args.push_back(var.args[0]); // ram block starts at
			varWrite.args.push_back(var.args[1]); // addr_size
			varWrite.args.push_back(var.args[2]); // word_size
			varWrite.args.push_back(var.args[4]); // write_enable
			varWrite.args.push_back(var.args[5]); // write_addr
			varWrite.args.push_back(var.args[6]); // write_data
			allvars.push_back(varWrite);

			// Remove the write parameters from the RAM read operation
			var.args.pop_back(); var.args.pop_back(); var.args.pop_back();
		}
	}

	/* Create the init function */

	os << "#import \"../src/netsim/comp_netlist_sim.hpp\"\n\n";

	os << "void NetsimCompRunner::init() {\n";

	for (std::string inName : net.inputs) {
		VarPos& loc = locOfVar[inName];
		loc.tabPos = iTransferTab++;
		os << "inputs.push_back(HardVariable{ \"" << inName
			<< "\", " << loc.tabPos << " });\n";
	}
	for (std::string outName : net.outputs) {
		VarPos& loc = locOfVar[outName];
		loc.tabPos = iTransferTab++;
		os << "outputs.push_back(HardVariable{ \"" << outName
			<< "\", " << loc.tabPos << " });\n";
	}
	os << "transferTab.resize(" << iTransferTab << ", 0);\n";

	os << "ram.resize(" << sizeRam << ", 0);\n";
	os << "registers.resize(" << nbRegistersOp << ", 0);\n";
	os << "}\n\n";

	/* Create the run function */

	// Initialize the operation vector

	os << "void NetsimCompRunner::cycle(uint nbCycles) {\n";
	os << "uint addr;\n";
	os << "\n";

	for (uint i = 0; i < sizeState; i++) {
		os << "boolType var_" << i << " = 0;\n";
	}

	// Init constants
	os << "// Init constants\n";
	for (Variable& var : allvars) {
		if (var.operation == OpConst && var.args[0].type == ArgBool) {
			copyArg(os, locOfVar, var.loc, var.args[0]);
		}
	}

	// Main loop
	os << "\nfor (uint iCycle = 0; nbCycles == 0 || iCycle < nbCycles; iCycle++) {\n";
	os << "onCycleBegin(iCycle);\n";
	for (uint i = 0; i < nbRegistersOp; i++) {
		os << "var_" << i << " = registers[" << i << "];\n";
	}
	for (std::string inName : net.inputs) {
		VarPos& loc = locOfVar[inName];
		os << "var_" << loc.pos << " = transferTab[" << loc.tabPos << "];\n";
	}

	for (Variable& var : allvars) {
		os << "// " << var.name << " = " << strOfOp(var.operation);
		for (Arg& a : var.args) {
			os << " [" << a.repr << "]";
		}
		os << "\n";

		if (var.operation == OpSelect) { // Remove Select operations
			VarPos blockPt = locOfVar[var.args[1].repr];
			blockPt = blockPt.extract(var.args[0].intValue, var.args[0].intValue);

			var.loc = blockPt;
			locOfVar[var.name] = blockPt;
			// os << "sss[" << var.loc.pos << "] = " << reprOfLoc(blockPt) << ";";
		}
		else if (var.operation == OpSlice) { // Remove Slice operations
			VarPos blockPt = locOfVar[var.args[2].repr];
			blockPt = blockPt.extract(var.args[0].intValue, var.args[1].intValue);

			var.loc = blockPt;
			locOfVar[var.name] = blockPt;
			// os << "sss[" << var.loc.pos << "] = " << reprOfLoc(blockPt) << ";";
		}
		else if (var.operation == OpConst && var.args[0].type != ArgBool) {
			copyArg(os, locOfVar, var.loc, var.args[0]);
		}
		else if (var.operation == OpConcat) {
			// if (nbDependOf[var.name] > 0) {
			uint sizePrev = 0;
			bool setWithOr = false;
			for (Arg& arg : var.args) {
				uint sizeArg = sizeOfArg(arg, idOfVar, allvars);
				sizePrev += sizeArg;
				copyArg(os, locOfVar, var.loc, arg, var.size - sizePrev, setWithOr);
				setWithOr = true;
			}
			// }
		}
		else if (var.operation & FLAG_BIN_OPS) {
			os << "var_" << var.loc.pos << " = ";
			if (var.operation == OpOr) {
				os << REPR(var.args[0]) << " | " << REPR(var.args[1]);
			}
			else if (var.operation == OpAnd) {
				os << REPR(var.args[0]) << " & " << REPR(var.args[1]);
			}
			else if (var.operation == OpXor) {
				os << "(" << REPR(var.args[0]) << " ^ " << REPR(var.args[1])
					<< ") & " << maskFor(var.loc);
			}
			else if (var.operation == OpNand) {
				os << "~(" << REPR(var.args[0]) << " & " << REPR(var.args[1]) << ")";
			}
			os << ";\n";
		}
		else if (var.operation == OpNot) {
			os << "var_" << var.loc.pos << " = (~" << REPR(var.args[0]) << ") &"
				<< maskFor(var.loc)
				<< ";\n";
		}
		else if (var.operation == OpMux) {
			os << "if (" << REPR(var.args[0]) << " & 1) {\n";
			copyArg(os, locOfVar, var.loc.pos, var.args[2]);
			os << "} else {\n";
			copyArg(os, locOfVar, var.loc.pos, var.args[1]);
			os << "}\n";
		}
		else if (var.operation == OpRam || var.operation == OpRom || var.operation == OpRamWrite) {
			int blockStart = var.args[0].intValue;
			int iAddr = var.operation == OpRamWrite ? 4 : 3;
			os << "addr = ((" << REPR(var.args[iAddr]) << ") >> 5) + " << blockStart << ";\n";

			if (var.operation == OpRam || var.operation == OpRom) {
				os << "var_" << var.loc.pos << " = ram[addr];\n";
			}
			else {
				os << "if (" << REPR(var.args[3]) << ") {\n";
				os << "    ram[addr] = " << REPR(var.args[5]) << ";\n";
				os << "}\n";
			}
		}
		else if (var.operation != OpReg && var.operation != OpConst) {
			throw UsageError("Unknwown operation");
		}
	}
	for (uint iRegister = 0; iRegister < nbRegistersOp; iRegister++) {
		Variable& var = allvars[iRegister];
		VarPos& registeredPt = locOfVar[var.args[0].repr];
		os << "registers[" << iRegister << "] = var_" << registeredPt.pos << ";\n";
	}
	for (std::string outName : net.outputs) {
		VarPos& loc = locOfVar[outName];
		os << "transferTab[" << loc.tabPos << "] = var_" << loc.pos << ";\n";
	}
	os << "\n";
	os << "try {\n";
	os << "    this->onCycleEnd(iCycle);\n";
	os << "} catch (StopCycling) {\n";
	os << "    break;\n";
	os << "}\n}\n}\n";
}
