#if !defined(EXCEPTIONS)
#define EXCEPTIONS

#include <string>
#include <exception>

class UnknownError : public std::exception {
	const char* what() const throw();
};

class UsageError : public std::exception {
	std::string str;
	const char* what() const throw();
public:
	std::string get();
	UsageError(std::string s) : str(s) {};
};

class IOError : public UsageError {
	using UsageError::UsageError;
};

#endif // EXCEPTIONS
