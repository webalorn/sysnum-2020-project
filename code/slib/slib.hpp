#if !defined(SLIB_HPP)
#define SLIB_HPP

// #define MUL_EXT true
// #define DIV_EXT true
// #define MUL_DIV_EXT true

#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)

typedef unsigned int uint;

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;


extern "C" void exit(int v);

// inline void shutdown() {
// 	*out_addr = 1;
// }

inline uint read_drive(uint at) {
	HDD_ADDR = at;
	return R_HDD;
}

inline uint strlen(const char* s) {
	uint l = 0;
	while (*s) {
		s++, l++;
	}
	return l;
}

/* Arithmetic */

inline uint mul(uint a, uint b) {
#ifdef MUL_EXT
	return a * b;
#else
	uint r = 0;
	while (b) {
		if (b & 1) {
			r += a;
		}
		b = b >> 1;
		a = a << 1;
	}
	return r;
#endif
}

/* Memory managment */

#define MAX_BLOCKS 100

uint nbBlocks = 0;
void** allocPos;
int* allocSize;
uint __asm__freept = 0; // Initilized by the assembly code

void* malloc(int size) {
	for (int iBlock = 0; iBlock < nbBlocks; iBlock++) {
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
	for (int iBlock = 0; iBlock < nbBlocks; iBlock++) {
		if (allocPos[iBlock] == pos) {
			allocSize[iBlock] = -allocSize[iBlock]; // Set positive again
			return;
		}
	}
	exit(40); // X
}

template<class T> inline T* _new(int size = 1) {
	return (T*)malloc(mul(size, sizeof(T)));
}

template<class T> inline void _del(T* pos) {
	free((void*)pos);
}

void initMemManager() {
	allocPos = (void**)__asm__freept;
	__asm__freept += MAX_BLOCKS << 2;
	allocSize = (int*)__asm__freept;
	__asm__freept += MAX_BLOCKS << 2;
}

#endif // SLIB_HPP
