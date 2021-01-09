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
	else if (opFlags == 0) return "NOTHING";
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

VarPos::VarPos(uint pos, uint size, uint rightOffset, bool full)
	: pos(pos), size(size), rightOffset(rightOffset), full(full) {}

VarPos VarPos::extract(uint begin, uint end) {
	return VarPos(pos, end - begin + 1, rightOffset + size - end - 1, false);
}

Variable::Variable(std::string name, Operation operation, uint size, std::vector<Arg> args)
	: name(name), operation(operation), size(size), args(args) {}

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

std::ostream& operator<<(std::ostream& os, const Memory& mem) {
	for (bool b : mem) {
		os << b;
	}
	return os;
}
