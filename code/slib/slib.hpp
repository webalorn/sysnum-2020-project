#if !defined(SLIB_HPP)
#define SLIB_HPP

#include "clib.hpp"

// #define MUL_EXT 1
// #define DIV_EXT 1

#ifdef MUL_EXT
#ifdef DIV_EXT
#define MUL_DIV_EXT 1
#endif
#endif

#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)
#define W_SCREEN *(out_addr + 3)

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;

#ifndef DIV_EXT
const uint digits32[10] = { 1000000000 , 100000000 , 10000000 , 1000000 , 100000 , 10000 , 1000 , 100, 10, 1 };
#endif


// inline void shutdown() {
// 	*out_addr = 1;
// }

inline uint read_drive(uint at) {
	HDD_ADDR = at;
	return R_HDD;
}

inline uint strlen(const char32_t* s) {
	uint l = 0;
	while (*s) {
		s++, l++;
	}
	return l;
}


#ifndef DIV_EXT
void uint2str(uint num, char32_t* arr, uint nbdigits, char16_t blank) {
	bool before = false;
	for (uint i = 10 - nbdigits; i < 10; i++) {
		int cur = 0;
		while (num >= digits32[i]) {
			cur += 1;
			num -= digits32[i];
		}
		if (cur || before) {
			before = true;
			*arr = '0' + cur;
		}
		else {
			*arr = blank;
		}
		arr++;
	}
}
#endif

/*
	Memory managment
*/


extern "C" {
	uint __asm__freept = 0; // Initilized by the assembly code
	void* _Znwj(int size);
	void* _Znaj(int size);
	void _ZdaPv(void* pt);
	void _ZdlPv(void* pt);
}

#define MAX_BLOCKS 100

uint nbBlocks = 0;
void** allocPos;
int* allocSize;
// uint __asm__freept = 0;


// void* malloc(uint size) {
// 	for (uint iBlock = 0; iBlock < nbBlocks; iBlock++) {
// 		if (allocSize[iBlock] >= size) {
// 			allocSize[iBlock] = -allocSize[iBlock]; // Negative means used
// 			return allocPos[iBlock];
// 		}
// 	}
// 	if (nbBlocks == MAX_BLOCKS) {
// 		exit(29); // M
// 	}
// 	void* pt = (void*)__asm__freept;
// 	allocPos[nbBlocks] = pt;
// 	allocSize[nbBlocks] = -size;
// 	nbBlocks++;
// 	__asm__freept += size;
// 	return pt;
// }

// void free(void* pos) {
// 	for (int iBlock = 0; iBlock < nbBlocks; iBlock++) {
// 		if (allocPos[iBlock] == pos) {
// 			allocSize[iBlock] = -allocSize[iBlock]; // Set positive again
// 			return;
// 		}
// 	}
// 	exit(40); // X
// }

void* malloc(int size) {
	if (size == 0) {
		return 0;
	}
	for (uint iBlock = 0; iBlock < nbBlocks; iBlock++) {
		if (allocSize[iBlock] >= size) {
			allocSize[iBlock] = -allocSize[iBlock]; // Negative means used
			return allocPos[iBlock];
		}
	}
	if (nbBlocks == MAX_BLOCKS) {
		exit(29); // M
	}
	void* pt = (void*)__asm__freept;
	allocPos[nbBlocks] = pt;
	allocSize[nbBlocks] = -size;
	nbBlocks++;
	__asm__freept += size;
	return pt;
}

void free(void* pos) {
	if (pos == 0) {
		return;
	}
	for (int iBlock = 0; iBlock < nbBlocks; iBlock++) {
		if (allocPos[iBlock] == pos) {
			allocSize[iBlock] = -allocSize[iBlock]; // Set positive again
			return;
		}
	}
	exit(40); // X
}

// template<class T> inline T* _new(int size = 1) {
// 	return (T*)malloc(mul(size, sizeof(T)));
// }

// template<class T> inline void _del(T* pos) {
// 	free((void*)pos);
// }

void* _Znwj(int size) {
	return malloc(size);
}
void* _Znaj(int size) {
	return malloc(size);
}
void _ZdaPv(void* pt) {
	free(pt);
}
void _ZdlPv(void* pt) {
	free(pt);
}


void initMemManager() {
	allocPos = (void**)__asm__freept;
	__asm__freept += MAX_BLOCKS << 5;
	allocSize = (int*)__asm__freept;
	__asm__freept += MAX_BLOCKS << 5;
}

#endif // SLIB_HPP
