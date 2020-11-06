#if !defined(SCREEN_HPP)
#define SCREEN_HPP

#include <vector>
#include <map>
#include <SFML/Graphics.hpp>
#include "periph.hpp"

class VirtualScreen {
protected:
	uint ratio;
	sf::RenderWindow window;
	sf::Event event;
	std::map<int, sf::Texture> textures;
public:
	VirtualScreen(uint width, uint height, uint ratio);
	void loop();

	void refresh();
	void drawRectangle(uint x, uint y, uint width, uint height, sf::Color color);
	void drawTexture(uint x, uint y, uint id);
	void storeTexture(uint id, uint width, uint height, std::vector<sf::Color>& pixels);
};

class ScreenOutput : public OutputDevice {
protected:
	VirtualScreen& screen;
	uint pos_x, pos_y, red, blue, green, curId;
	bool isLoading;
	std::vector<sf::Color> curTexture;
public:
	ScreenOutput(VirtualScreen& screen);
	void send(uint);
};

#endif // SCREEN_HPP
