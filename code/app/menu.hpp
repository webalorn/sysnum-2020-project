#include "app.hpp"
#include "clock.hpp"
#include "3d.hpp"
#include "editor.hpp"

void menuEntry(int pos, const char32_t* text) {
	show_screen_text(text, 30, 16 * pos + 46, 20);
}

void runMenu() {
	bool quitMenu = false;
	int pos = 0, maxPos = 4;

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
				if (pos == 2) runEditor();
				if (pos == 3) run3dScene();
				if (pos == 4) quitMenu = true;
			}
		}

		// Draw
		if (app->needToDraw()) {
			menuEntry(-2, U"Clock");
			menuEntry(-1, U"Fast");
			menuEntry(0, U"Editor");
			menuEntry(1, U"3D");
			menuEntry(2, U"Quit");
			show_screen_text(U">", 20, 14 + pos * 16, 2);
			refreshScreen();
		}
	}
}
