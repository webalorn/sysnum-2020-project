#if !defined(CLIB_HPP)
#define CLIB_HPP


typedef unsigned int uint;

/* Integer routines */

extern "C" {
	void exit(int v);
	void memcpy(char* dest, const char* src, uint n);

#ifndef MUL_EXT
	uint __mulsi3(uint a, uint b);
#endif

#ifndef DIV_EXT
	uint __udivsi3(uint a, uint b);
	uint __umodsi3(uint a, uint b);
#endif
}


void memcpy(char* dest, const char* src, uint n) {
	while (n) {
		n--;
		*dest = *src;
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
