#if !defined(IOSTREAM_HPP)
#define IOSTREAM_HPP

#include "slib.hpp"

class IStream {
	virtual uint readWord() = 0;
	virtual char readByte() = 0;
};

class OStream {
public:
	virtual const void send_word(const uint word) = 0;
};

/* Text output stream */


#ifndef DIV_EXT
const uint digits32[10] = { 1000000000 , 100000000 , 10000000 , 1000000 , 100000 , 10000 , 1000 , 100, 10, 1 };
#endif

class TextOutStream : public OStream {

#ifdef DIV_EXT
	void print_digits(const uint v) {
		if (v) {
			print_digits(v / 10);
			this->send_word(v % 10);
		}
	}
#endif

public:
	virtual const void send_word(const uint word) = 0;

	inline void send_digits(uint n, const uint maxdigits = 10) {
		if (n == 0) {
			this->send_word('0');
		}
		else {
#ifdef DIV_EXT
			this->print_digits(n);
#else
			bool before = false;
			for (uint i = 10 - maxdigits; i < 10; i++) {
				int cur = 0;
				while (n >= digits32[i]) {
					cur += 1;
					n -= digits32[i];
				}
				if (cur || before) {
					before = true;
					this->send_word('0' + cur);
				}
			}
#endif
		}
	}
	inline void send_digits(int n, const uint maxidigits = 10) {
		if (n < 0) {
			n = -n;
			this->send_word('-');
		}
		this->send_digits((uint)n);
	}
};

TextOutStream& operator<<(TextOutStream& os, const char c) {
	os.send_word((uint)c);
	// *(out_addr + 1) = c;
	return os;
}

TextOutStream& operator<<(TextOutStream& os, const char* s) {
	while (*s) {
		os.send_word((uint)(*s));
		s++;
	}
	return os;
}

TextOutStream& operator<<(TextOutStream& os, uint n) {
	os.send_digits(n);
	return os;
}
TextOutStream& operator<<(TextOutStream& os, int n) {
	os.send_digits(n);
	return os;
}

/* Console Output Stream */

class StandardOutStream : public TextOutStream {
public:
	const void send_word(const uint word) {
		*(out_addr + 1) = word;
	}
};
static StandardOutStream cout;


#endif // IOSTREAM_HPP
