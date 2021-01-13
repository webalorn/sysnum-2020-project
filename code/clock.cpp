#define W_CONSOLE *(out_addr + 1)
#define HDD_ADDR *(out_addr + 2)
#define R_HDD *(in_addr + 1)

typedef unsigned int uint;

volatile uint* const in_addr = (uint*)0b10000000000000000000000000000000;
volatile uint* const out_addr = (uint*)0b10100000000000000000000000000000;

extern "C" {
	uint __mulsi3(uint a, uint b);
	uint __udivsi3(uint a, uint b);
}

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


void breakdown(uint& time, uint& v, uint move) {
	while (time > move) {
		v++;
		time -= move;
	}
}

inline void showDate(uint days) {
	uint fourYearsBlock = days / 1461;
	days -= fourYearsBlock * 1461;
	uint year = 2004 + (fourYearsBlock << 2);
	uint months = 1;
	uint fevrier = 29;

	if (days >= 366) { // Bisextil
		year += 1;
		days -= 366;
		fevrier = 28;
		while (days >= 365) { // Up to 2 times
			year += 1;
			days -= 365;
		}
	}
	if (days >= 31) {
		months += 1, days -= 31;
		if (days >= fevrier) {
			months += 1, days -= fevrier;

			if (days < 31) goto skip; // Mars
			months += 1, days -= 31;
			if (days < 30) goto skip; // Avril
			months += 1, days -= 30;
			if (days < 31) goto skip; // Mai
			months += 1, days -= 31;
			if (days < 30) goto skip; // Juin
			months += 1, days -= 30;
			if (days < 31) goto skip; // Juillet
			months += 1, days -= 31;
			if (days < 31) goto skip; // Aout
			months += 1, days -= 31;
			if (days < 30) goto skip; // Septembre
			months += 1, days -= 30;
			if (days < 31) goto skip; // Octobre
			months += 1, days -= 31;
			if (days < 30) goto skip; // Novembre
			months += 1, days -= 30;
			if (days < 31) goto skip; // Decembre
			months += 1, days -= 31;
		}
	}
skip:
	uint d1 = '0';
	days++;
	while (days >= 10) {
		d1++;
		days -= 10;
	}
	W_CONSOLE = d1;
	W_CONSOLE = '0' + days;
	W_CONSOLE = '/';
	if (months >= 10) {
		W_CONSOLE = '1';
		months -= 10;
	}
	else {
		W_CONSOLE = '0';
	}
	W_CONSOLE = '0' + months;
	W_CONSOLE = '/';
	uint y1 = year / 1000;
	year -= y1 * 1000;
	W_CONSOLE = '0' + y1;
	y1 = year / 100;
	year -= y1 * 100;
	W_CONSOLE = '0' + y1;
	y1 = year / 10;
	year -= y1 * 10;
	W_CONSOLE = '0' + y1;
	W_CONSOLE = '0' + year;
	W_CONSOLE = ' ';
}

int main() {
	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';

	uint time = *(in_addr + 1) + 3600; // UTC + 1
	time -= 1072915200; // 01/01/2004
	uint days = time / 86400;
	time -= days * 86400;

	breakdown(time, h1, 36000);
	breakdown(time, h0, 3600);
	breakdown(time, m1, 600);
	breakdown(time, m0, 60);
	breakdown(time, s1, 10);
	breakdown(time, s0, 1);

	W_CONSOLE = (uint)'\n';
	showDate(days);
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
						W_CONSOLE = '\b';
						W_CONSOLE = '\b';
						W_CONSOLE = '\b';
						m1 = '0';
						h0++;
						if (h0 == ':') {
							h1++;
							h0 = '0';
						}
						if (h0 == '4' && h1 == '2') {
							// *out_addr = 1;
							h0 = '0';
							h1 = '0';

							W_CONSOLE = '\r';
							days++;
							showDate(days);
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
