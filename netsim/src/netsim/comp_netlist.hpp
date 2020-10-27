#if !defined(NETLIST_GENERATOR_HPP)
#define NETLIST_GENERATOR_HPP

#include <string>
#include <vector>
#include <map>
#include <iostream>

#include "../util/exceptions.hpp"
#include "netlist.hpp"

void genNetlistCode(SoftNetlist& net, std::ostream& os);

#endif // NETLIST_GENERATOR_HPP
