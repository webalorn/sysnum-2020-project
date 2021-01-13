#include "app.hpp"

void breakdownTime(uint& time, uint& v, uint move) {
	while (time > move) {
		v++;
		time -= move;
	}
}

void runClock() {
	char32_t time_str[9] = U"00:00:00";
	bool quitClock = false;
	while (!quitClock) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (key == KEY_ESCAPE) {
				quitClock = true;
			}
		}

		// Draw
		if (app->needToDraw()) {
			uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';
			uint time = app->getTime();
			breakdownTime(time, h1, 36000);
			breakdownTime(time, h0, 3600);
			breakdownTime(time, m1, 600);
			breakdownTime(time, m0, 60);
			breakdownTime(time, s1, 10);
			breakdownTime(time, s0, 1);

			time_str[0] = h1;
			time_str[1] = h0;
			time_str[3] = m1;
			time_str[4] = m0;
			time_str[6] = s1;
			time_str[7] = s0;
			show_screen_text(time_str, 22, 46, 14);
			refreshScreen();
		}
	}
}

void runClockFast() {
	char32_t time_str[9] = U"00:00:00";
	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';
	uint time = app->getTime();

	bool quitClock = false;
	while (!quitClock) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (key == KEY_ESCAPE) {
				quitClock = true;
			}
		}

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
							// *out_addr = 1;
							h0 = '0';
							h1 = '0';
						}
					}
				}
			}
		}
		time_str[0] = h1;
		time_str[1] = h0;
		time_str[3] = m1;
		time_str[4] = m0;
		time_str[6] = s1;
		time_str[7] = s0;
		show_screen_text(time_str, 22, 46, 14);
		refreshScreen();
	}
}
