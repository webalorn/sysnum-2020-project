#include "exceptions.hpp"

const char* UnknownError::what() const throw() {
	return "Some unknown or undocumented error happened";
}

const char* UsageError::what() const throw() {
	return str.c_str();
}
std::string UsageError::get() {
	return str;
}
