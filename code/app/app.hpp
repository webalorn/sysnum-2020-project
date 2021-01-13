#include "../slib/slib.hpp"
#include "../slib/iostream.hpp"
#include "../slib/vector.hpp"
#include "../slib/algorithm.hpp"
#include "../slib/string.hpp"
#include "../slib/hdd.hpp"
#include "../slib/screen.hpp"

#include "tiles.hpp"

#ifndef APP_HPP
#define APP_HPP

class App;
App* app;

class App {
	uint rootPath;
	uint curTime;
	uint clockTicks;
	uint holdEvent;
	uint drawTick;

public:
	void loop() {
		while (*in_addr) {
			clockTicks += 1;
			drawTick = 1;
			if (clockTicks == 8) {
				curTime++;
				clockTicks = 0;
			}
		}
	}
	App() : curTime(0), clockTicks(0), holdEvent(0), drawTick(0) {
		initMemManager();
		cout << U"App started 🔥🐉\n";

		rootPath = hdd_root();
		uint images_path = hdd_cd(rootPath, U"images");
		uint alphabet_path = hdd_cd(images_path, U"alphabet");

		cout << "Loading sprites...\n";
		load_alphabet_tiles(alphabet_path);
		cout << "Sprites loaded\n";

		// Init clock
		curTime = *(in_addr + 3);
	}
	bool hasEvent() {
		if (holdEvent == 0) {
			holdEvent = *(in_addr + 2);
		}
		return holdEvent != 0;
	}
	uint getEvent() {
		uint ev = holdEvent;
		holdEvent = 0;
		return ev;
	}
	uint needToDraw() {
		if (drawTick) {
			drawTick = 0;
			return 1;
		}
		return 0;
	}
	uint getTime() {
		return curTime;
	}
};




#define KEY_ESCAPE 37
#define KEY_COMMA 50
#define KEY_PERIOD 51
#define KEY_SPACE 58
#define KEY_ENTER 59
#define KEY_BACK 60
#define KEY_LEFT 72
#define KEY_RIGHT 73
#define KEY_UP 74
#define KEY_DOWN 75

#define KEY_LSHIFT 39
#define KEY_RSHIFT 43

#endif
