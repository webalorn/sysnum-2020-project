#include "app.hpp"
#include "clock.hpp"
#include "3d.hpp"

void menuEntry(int pos, const char32_t* text) {
	show_screen_text(text, 30, 16 * pos + 46, 20);
}

void runMenu() {
	bool quitMenu = false;
	int pos = 0, maxPos = 3;

	while (!quitMenu) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (key == KEY_DOWN && pos < maxPos) {
				pos++;
			}
			else if (key == KEY_UP && pos > 0) {
				pos--;
			}
			else if (key == KEY_ENTER) {
				if (pos == 0) runClock();
				if (pos == 1) runClockFast();
				if (pos == 3) quitMenu = true;
			}
		}

		// Draw
		if (app->needToDraw()) {
			menuEntry(0 - pos, U"Clock");
			menuEntry(1 - pos, U"Fast");
			menuEntry(2 - pos, U"3D");
			menuEntry(3 - pos, U"Quit");
			show_screen_text(U">", 20, 46, 2);
			refreshScreen();
		}
	}
}
