#if !defined(SCREEN_HPP)
#define SCREEN_HPP

#include "slib.hpp"
#include "hdd.hpp"

inline void send_screen_word(uint op, uint arg1, uint arg2, uint arg3) {
	arg2 += arg3 << 8;
	arg1 += arg2 << 8;
	W_SCREEN = op + (arg1 << 8);
}

void setScreenPos(uint x, uint y) {
	send_screen_word(1, x, y, 0);
}

void setScreenColor(uint red, uint blue, uint green) {
	send_screen_word(2, red, blue, green);
}

void setPixel(uint x, uint y) {
	send_screen_word(3, x, y, 0);
}

void drawRectangle(uint width, uint height) {
	send_screen_word(4, width, height, 0);
}

void drawTexture(uint id) {
	send_screen_word(5, id, 0, 0);
}

void startSendingTexture(uint id) {
	send_screen_word(6, id, 0, 0);
}
void sendTexturePixel(uint red, uint blue, uint green, uint alpha) {
	if (alpha == 0) {
		send_screen_word(1, 1, 1, 0);
	}
	else {
		send_screen_word(red, blue, green, alpha);
	}
}

void refreshScreen() {
	send_screen_word(42, 0, 0, 0);
}

void sendTexture(File& file, uint id) {
	uint height, width;
	file >> height >> width;
	setScreenPos(width, height);
	startSendingTexture(id);
	for (uint row = 0; row < height; row++) {
		for (uint col = 0; col < width; col++) {
			W_SCREEN = file.readWord();
		}
	}
}

#endif // SCREEN_HPP
