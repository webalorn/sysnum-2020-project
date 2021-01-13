#include "sf_screen.hpp"
#include "../util/exceptions.hpp"

VirtualScreen::VirtualScreen(uint width, uint height, uint ratio) :
	ratio(ratio), window(sf::VideoMode(width* ratio, height* ratio), "Screen", sf::Style::Titlebar | sf::Style::Close) {
	window.clear();
}
void VirtualScreen::loop() {
	while (window.pollEvent(event)) {
		if (event.type == sf::Event::Closed) {
			window.close();
			throw StopCycling();
		}
		else if (event.type == sf::Event::KeyPressed) {
			uint code = event.key.code + 1;
			keyQueue.push_back(code);
		}
	}
}

void VirtualScreen::drawRectangle(uint x, uint y, uint width, uint height, sf::Color color) {
	sf::RectangleShape rect(sf::Vector2f(ratio * width, ratio * height));
	rect.setPosition(sf::Vector2f(x * ratio, y * ratio));
	rect.setFillColor(color);
	window.draw(rect);
}

void VirtualScreen::drawTriangle(uint x1, uint y1, uint x2, uint y2, uint x3, uint y3, sf::Color color) {
	sf::ConvexShape triangle;
	triangle.setFillColor(color);
	triangle.setPointCount(3);
	triangle.setPoint(0, sf::Vector2f(ratio * x1, ratio * y1));
	triangle.setPoint(1, sf::Vector2f(ratio * x2, ratio * y2));
	triangle.setPoint(2, sf::Vector2f(ratio * x3, ratio * y3));
	window.draw(triangle);
}

void VirtualScreen::drawTexture(uint x, uint y, uint id) {
	sf::Texture tex = textures[id];
	sf::Sprite sprite;
	sprite.setTexture(tex);
	sprite.setPosition(sf::Vector2f(x * ratio, y * ratio));
	window.draw(sprite);
}
void VirtualScreen::storeTexture(uint id, uint width, uint height, std::vector<sf::Color>& pixels) {
	sf::Texture tex;
	sf::RenderTexture renderTexture;
	renderTexture.create(width * ratio, height * ratio);
	renderTexture.clear();

	sf::RectangleShape rect(sf::Vector2f(ratio, ratio));
	for (uint y = 0; y < height; y++) {
		for (uint x = 0; x < width; x++) {
			rect.setPosition(sf::Vector2f(x * ratio, y * ratio));
			rect.setFillColor(pixels[y * width + x]);
			renderTexture.draw(rect);
		}
	}

	renderTexture.display();
	textures[id] = renderTexture.getTexture();
}

void VirtualScreen::refresh() {
	window.display();
	window.clear();
}

/*
	SCREEN OUTPUT

	Operations :
	- 1 <x:8> <y:8> : Set the position on the screen
	- 2 <r:8> <g:8> <b:8> : Set the current color
	- 3 <x:8> <y:8> : Draw a single pixel (current color)
	- 4 <w:8> <h:8> : Draw a rectangle (current color & position)
	- 5 <id:16> : Draw a texture (current position)
	- 6 <id:16> : Define or replace a texture. The size will be x*y. The next x*y operations should be <r> <g> <b> <alpha>, and can't be 0 0 0 0
	- 7 <x:8> <y:8> : Set the second position on the screen
	- 8 <x:8> <y:8> : Set the third on the screen
	- 9 <r:8> <g:8> <b:8> : Draw a triangle (of color <r> <b> <g>)

	- 42 : Refrash screen (display)
*/


ScreenOutput::ScreenOutput(VirtualScreen& screen) : screen(screen), isLoading(false) {}

void ScreenOutput::send(uint cmd) {
	screen.loop();
	if (cmd) {
		uint op = cmd % 256;
		uint arg1 = (cmd >> 8) % 256;
		uint arg2 = (cmd >> 16) % 256;
		uint arg3 = cmd >> 24;

		if (isLoading) {
			curTexture.push_back(sf::Color(op, arg1, arg2, arg3));
			if (curTexture.size() >= pos_x * pos_y) {
				screen.storeTexture(curId, pos_x, pos_y, curTexture);
				isLoading = false;
			}
		}
		else {
			switch (op) {
			case 1:
				pos_x = arg1;
				pos_y = arg2;
				break;
			case 2:
				red = arg1;
				blue = arg2;
				green = arg3;
				break;
			case 3:
				screen.drawRectangle(arg1, arg2, 1, 1, sf::Color(red, blue, green));
				break;
			case 4:
				screen.drawRectangle(pos_x, pos_y, arg1, arg2, sf::Color(red, blue, green));
				break;
			case 5:
				screen.drawTexture(pos_x, pos_y, cmd >> 8);
				break;
			case 6:
				if (pos_x * pos_y) {
					curTexture.clear();
					isLoading = true;
					curId = cmd >> 8;
				}
				break;
			case 7:
				pos2_x = arg1;
				pos2_y = arg2;
				break;
			case 8:
				pos3_x = arg1;
				pos3_y = arg2;
				break;
			case 9:
				screen.drawTriangle(pos_x, pos_y, pos2_x, pos2_y, pos3_x, pos3_y,
					sf::Color(arg1, arg2, arg3));
				break;
			case 42:
				screen.refresh();
				break;

			default:
				break;
			}
		}
	}
}


// Keyboard input

KeyboardInput::KeyboardInput(VirtualScreen& screen) : screen(screen) {}

void KeyboardInput::run() {
	while (screen.keyQueue.size()) {
		inQueue.push(screen.keyQueue.front());
		screen.keyQueue.pop_front();
	}
}
