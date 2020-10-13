#if !defined(IO_HPP)
#define IO_HPP

#include <string>
#include "netsim/netlist.hpp"


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


#endif // IO_HPP
