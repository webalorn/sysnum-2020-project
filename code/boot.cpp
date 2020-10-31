#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)

typedef unsigned int uint;

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;

const char32_t* boot_message = U"\033[34mBooted\n\033[0m";
const char32_t* success_msg = U"\n\033[32mOK\033[0m\n";
const char32_t* error_msg = U"\n\033[31mFailed\033[0m\n";
char32_t message_return[6] = U"-> ";

void print_message(const char32_t* message) {
	while (*message) {
		W_CONSOLE = *message;
		message++;
	}
}

int main() {
	volatile uint* ram = 0;
	HDD_ADDR = 4; // Where is stored the size of the program to be loaded
	uint progSize = R_HDD >> 2;

	for (uint iWord = 0; iWord < progSize; iWord++) {
		HDD_ADDR = (iWord << 2) + 8;
		*(ram + iWord) = R_HDD;
	}
	uint iCar = 0;
	uint returnCode;
	print_message(boot_message);

	asm volatile ("mv s2, a0\n\t");
	asm volatile ("jalr zero\n\t");
	asm volatile ("mv %0, a0\n\t" : "=r"(returnCode));
	// asm volatile ("mv a0, s2\n\t");

	if (returnCode == 0) {
		print_message(success_msg);
	}
	else {
		print_message(error_msg);

		print_message(message_return);
		W_CONSOLE = '0' + returnCode;
		W_CONSOLE = '\n';
	}

	*out_addr = 1;
}
