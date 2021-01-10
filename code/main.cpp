#include "slib/slib.hpp"
#include "slib/iostream.hpp"
#include "slib/vector.hpp"
#include "slib/algorithm.hpp"
#include "slib/string.hpp"
#include "slib/hdd.hpp"
#include "slib/screen.hpp"
#include "game/tiles.hpp"

int main() {
	initMemManager();

	for (int i = 0; i < 200; i++) {
		string s("hello there");
		cout << s;
	}

	// cout << U"Hello there! 🐙\n";

	// setScreenColor(255, 0, 0);
	// setScreenPos(40, 10);
	// setPixel(0, 0);
	// setScreenColor(0, 255, 0);
	// drawRectangle(40, 20);
	// refreshScreen();

	// cout << "Loading sprites...\n";
	// uint root = hdd_root();
	// uint images_path = hdd_cd(root, U"images");
	// load_all_tiles(images_path);
	// cout << "Done\n";

	// show_screen_text(U"Hello there !", 0, 0, 6);

	// refreshScreen();


	/*
	string s1("This is");
	string s2(U"not the droids you are looking for 🤖");
	uint a = 120, b = 9;

	cout << s1 << ' ' << s2 << "\n";
	cout << a % b << '\n';
	// return 0;

	uint root = hdd_root();
	cout << "root = " << root << "\n";

	uint file = hdd_cd(root, U"test1.txt");
	uint dir = hdd_cd(root, U"sub");
	uint file2 = hdd_cd(dir, U"general.txt");

	File f(file2);
	// File f(file);
	cout << '"' << read_utf8(f) << "\"\n";

	cout << "file = " << file << "\n";
	cout << "dir = " << dir << "\n";
	*/
}
