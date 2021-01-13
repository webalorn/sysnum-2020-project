#include "app.hpp"

void runEditor() {
	cout << "editor...\n";
	const int W = 14;
	const int MAX = 196;
	char32_t text[MAX + 1] = U"Write some text...                                                                                                                                                                                  ";
	uint posChar = 18;
	uint blink = 0;
	bool maj = false;

	while (true) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (posChar < MAX - 1) {
				if (key < 27) { // Letter
					if (maj) text[posChar++] = 'A' + key - 1;
					else text[posChar++] = 'a' + key - 1;
				}
				else if (key < 37) { // Number
					text[posChar++] = '0' + key - 27;
				}
				else if (key == KEY_SPACE) {
					text[posChar++] = ' ';
				}
				else if (key == KEY_COMMA) {
					text[posChar++] = ',';
				}
				else if (key == KEY_PERIOD) {
					text[posChar++] = '.';
				}
				if (key == KEY_LSHIFT || key == KEY_RSHIFT) {
					maj = true;
				}
				else {
					maj = false;
				}
			}
			if (key == KEY_BACK) {
				if (posChar > 0) {
					text[posChar--] = ' ';
				}
			}
			else if (key == KEY_ESCAPE) {
				return;
			}
		}

		if (app->needToDraw()) {
			blink += 1;
			if (blink == 8) {
				blink = 0;
			}
			if (posChar < MAX - 1) {
				if (blink < 4) {
					text[posChar] = '@';
				}
				else {
					text[posChar] = ' ';
				}
			}
			show_screen_text(text, 1, 1, 14);
			refreshScreen();
		}
	}
}
