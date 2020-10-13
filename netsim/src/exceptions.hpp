#if !defined(EXCEPTIONS)
#define EXCEPTIONS

#include <string>
#include <exception>

class UnknownError : public std::exception {
	const char* what() const throw() {
		return "Some unknown or undocumented error happened";
	}
};

class UsageError : public std::exception {
	const char* str;
	const char* what() const throw() {
		return str;
	}
public:
	UsageError(std::string s) : str(s.c_str()) {};
};

#endif // EXCEPTIONS
