#if !defined(IO_HPP)
#define IO_HPP

#include <string>
#include <fstream>
#include "netsim/netlist.hpp"
#include "exceptions.hpp"


class NetlistParser {
protected:
	std::vector<std::string> words;
	std::string curWord;

public:
	SoftNetlist parseFrom(std::ifstream& fileStream);

protected:
	bool isSeparator(char c);
	bool isWhitelike(char c);

	void nextWord();
	Operation opWordToOp(std::string);
};

SoftNetlist loadNetlistFrom(std::string);


void readBitsTo(std::ifstream& stream, Memory& mem, int size);
void flowBitFrom(std::ifstream& stream, Memory& mem, bool extend = true);


#endif // IO_HPP
