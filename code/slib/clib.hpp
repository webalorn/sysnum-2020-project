#if !defined(CLIB_HPP)
#define CLIB_HPP


typedef unsigned int uint;

/* Integer routines */

extern "C" {
	void exit(int v);
	// void memcpy(char* dest, const char* src, uint n);
	void memcpy(uint* dest, const uint* src, uint n);
	void memset(char* dest, char src, uint n);

#ifndef MUL_EXT
	uint __mulsi3(uint a, uint b);
	long __muldi3(long a, long b);
#endif

#ifndef DIV_EXT
	uint __udivsi3(uint a, uint b);
	uint __divsi3(int a, int b);
	uint __umodsi3(uint a, uint b);
#endif
}


void memcpyChar(char* dest, const char* src, uint n) {
	while (n) {
		n--;
		*dest = *src;
		dest += 1;
		src += 1;
	}
}
void memcpy(uint* dest, const uint* src, uint n) {
	while (n > 3) {
		n -= 4;
		*dest = *src;
		dest++;
		src++;
	}
	if (n) {
		memcpyChar((char*)dest, (char*)src, n);
	}
}
void memset(char* dest, char src, uint n) {
	while (n) {
		n--;
		*dest = src;
		dest += 1;
		src += 1;
	}
}


#ifndef MUL_EXT
uint __mulsi3(uint a, uint b) {
	uint r = 0;
	uint one = 1;
	while (b) {
		if (b & one) {
			r += a;
		}
		b = b >> 1;
		a = a << 1;
	}
	return r;
}
long __muldi3(long a, long b) {
	long r = 0;
	long one = 1;
	while (b) {
		if (b & one) {
			r += a;
		}
		b = b >> 1;
		a = a << 1;
	}
	return r;
}
#endif

#ifndef DIV_EXT
uint __udivsi3(uint a, uint b) {
	uint n = 1, r = 0;
	while (b <= (a >> 1)) {
		n++;
		b <<= 1;
	}
	while (n) {
		n--;
		r <<= 1;
		if (a >= b) {
			a -= b;
			r += 1;
		}
		b >>= 1;
	}
	return r;
}
uint __divsi3(int a, int b) {
	bool inv = (a < 0) != (b < 0);
	a = a < 0 ? -a : a;
	b = b < 0 ? -b : b;
	int n = 1, r = 0;
	while (b <= (a >> 1)) {
		n++;
		b <<= 1;
	}
	while (n) {
		n--;
		r <<= 1;
		if (a >= b) {
			a -= b;
			r += 1;
		}
		b >>= 1;
	}
	return inv ? -r : r;
}


uint __umodsi3(uint a, uint b) {
	uint n = 1;
	while (b <= (a >> 1)) {
		n++;
		b <<= 1;
	}
	while (n) {
		n--;
		if (a >= b) {
			a -= b;
		}
		b >>= 1;
	}
	return a;
}
#endif

#endif // CLIB_HPP
