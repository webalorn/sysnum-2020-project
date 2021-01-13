#include "app.hpp"

uint dateYear, dateMonths, dateDays;

void computeDate(uint days) {
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
	dateYear = year;
	dateMonths = months;
	dateDays = days + 1;
}

void breakdownTime(uint& time, uint& v, uint move) {
	while (time > move) {
		v++;
		time -= move;
	}
}

void setDateStr(char32_t* date_str) {
	int a = dateDays / 10;
	date_str[0] = '0' + a;
	date_str[1] = '0' + (dateDays - a * 10);

	a = dateMonths / 10;
	date_str[3] = '0' + a;
	date_str[4] = '0' + (dateMonths - a * 10);

	string year;
	to_string(dateYear, year);
	date_str[6] = year[0];
	date_str[7] = year[1];
	date_str[8] = year[2];
	date_str[9] = year[3];
}

void runClock() {
	char32_t time_str[9] = U"00:00:00";
	char32_t date_str[11] = U"00/00/0000";

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
			uint time = app->getTime() + 3600; // UTC + 1
			time -= 1072915200; // 01/01/2004
			uint days = time / 86400;
			time -= days * 86400;
			computeDate(days);
			setDateStr(date_str);

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
			show_screen_text(date_str, 15, 20, 14);
			refreshScreen();
		}
	}
}

void runClockFast() {
	char32_t time_str[9] = U"00:00:00";
	char32_t date_str[11] = U"00/00/0000";

	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';
	uint time = app->getTime() + 3600; // UTC + 1
	time -= 1072915200; // 01/01/2004
	uint days = time / 86400;
	time -= days * 86400;

	computeDate(days);
	setDateStr(date_str);
	breakdownTime(time, h1, 36000);
	breakdownTime(time, h0, 3600);
	breakdownTime(time, m1, 600);
	breakdownTime(time, m0, 60);
	breakdownTime(time, s1, 10);
	breakdownTime(time, s0, 1);


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

							days++;
							computeDate(days);
							setDateStr(date_str);
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
		show_screen_text(date_str, 15, 20, 14);
		refreshScreen();
	}
}
