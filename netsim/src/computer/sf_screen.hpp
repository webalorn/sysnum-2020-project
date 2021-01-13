#if !defined(SCREEN_HPP)
#define SCREEN_HPP

#include <vector>
#include <deque>
#include <map>
#include <SFML/Graphics.hpp>
#include "periph.hpp"

class VirtualScreen {
protected:
	uint ratio;
	sf::RenderWindow window;
	sf::Event event;
	std::map<int, sf::Texture> textures;
	std::deque<uint> keyQueue;
public:
	VirtualScreen(uint width, uint height, uint ratio);
	void loop();

	void refresh();
	void drawRectangle(uint x, uint y, uint width, uint height, sf::Color color);
	void drawTriangle(uint x1, uint y1, uint x2, uint y2, uint x3, uint y4, sf::Color color);
	void drawTexture(uint x, uint y, uint id);
	void storeTexture(uint id, uint width, uint height, std::vector<sf::Color>& pixels);

	friend class KeyboardInput;
};

class ScreenOutput : public OutputDevice {
protected:
	VirtualScreen& screen;
	uint pos_x, pos_y, red, blue, green, curId;
	uint pos2_x, pos2_y, pos3_x, pos3_y;
	bool isLoading;
	std::vector<sf::Color> curTexture;
public:
	ScreenOutput(VirtualScreen& screen);
	void send(uint);
};

class KeyboardInput : public InputDevice {
protected:
	VirtualScreen& screen;
public:
	virtual void run();
	KeyboardInput(VirtualScreen& screen);
};

#endif // SCREEN_HPP
