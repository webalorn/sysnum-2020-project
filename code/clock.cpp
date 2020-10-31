#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)

typedef unsigned int uint;

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;


int main() {
	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';
	W_CONSOLE = '\n';
	while (1) {
		s0++;
		if (s0 == ':') {
			s0 = '0';
			s1++;
			if (s1 == '6') {
				s1 = '0';
				m0++;
				if (m0 == ':') {
					m0 = '0';
					m1++;
					if (m1 == '6') {
						m1 = '0';
						h0++;
						if (h0 == ':') {
							h1++;
							h0 = '0';
						}
						if (h0 == '4' && h1 == '2') {
							*out_addr = 1;
							// h0 = '0';
							// h1 = '0';
						}
					}
				}
			}

		}
		W_CONSOLE = '\r';
		W_CONSOLE = h1;
		W_CONSOLE = h0;
		W_CONSOLE = ':';
		W_CONSOLE = m1;
		W_CONSOLE = m0;
		W_CONSOLE = ':';
		W_CONSOLE = s1;
		W_CONSOLE = s0;
	}
	*out_addr = 1; // Shutdown
}
