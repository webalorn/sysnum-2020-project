#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)

typedef unsigned int uint;

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;


#ifndef FAST
void breakdown(uint& time, uint& v, uint move) {
	while (time > move) {
		v++;
		time -= move;
	}
}
#endif

int main() {
	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';

#ifndef FAST
	uint time = *(in_addr + 1);
	breakdown(time, h1, 36000);
	breakdown(time, h0, 3600);
	breakdown(time, m1, 600);
	breakdown(time, m0, 60);
	breakdown(time, s1, 10);
	breakdown(time, s0, 1);
#endif

	W_CONSOLE = (uint)'\n';
	W_CONSOLE = h1;
	W_CONSOLE = h0;
	W_CONSOLE = (uint)':';
	W_CONSOLE = m1;
	W_CONSOLE = m0;
	W_CONSOLE = (uint)':';
	W_CONSOLE = s1;
	W_CONSOLE = s0;

	while (1) {

#ifndef FAST
		if (!*in_addr) {
			continue;
		}
#endif

		s0++;
		W_CONSOLE = '\b';
		if (s0 == ':') {
			s0 = '0';
			s1++;
			W_CONSOLE = '\b';
			if (s1 == '6') {
				s1 = '0';
				m0++;
				W_CONSOLE = '\b';
				W_CONSOLE = '\b';
				if (m0 == ':') {
					m0 = '0';
					m1++;
					W_CONSOLE = '\b';
					if (m1 == '6') {
						W_CONSOLE = '\r';
						m1 = '0';
						h0++;
						if (h0 == ':') {
							h1++;
							h0 = '0';
						}
						if (h0 == '4' && h1 == '2') {
							*out_addr = 1;
							h0 = '0';
							h1 = '0';
						}
						W_CONSOLE = h1;
						W_CONSOLE = h0;
						W_CONSOLE = ':';
					}
					W_CONSOLE = m1;
				}
				W_CONSOLE = m0;
				W_CONSOLE = ':';
			}
			W_CONSOLE = s1;
		}
		W_CONSOLE = s0;
	}
	*out_addr = 1; // Shutdown
}
