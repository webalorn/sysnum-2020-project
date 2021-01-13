#if !defined(TILES_HPP)
#define TILES_HPP

#include "../slib/hdd.hpp"
#include "../slib/screen.hpp"

/*
	Ids until 256 : alphabet
*/

#define MAP_ID = 125

/* Load tiles */

void load_tile(uint id, uint dir, const char32_t* name) {
	File img{ hdd_cd(dir, name) };
	sendTexture(img, id);
}

void load_alphabet_tiles(uint dir) {
	char32_t name[6] = U"?.sbi";
	char32_t name_upper[8] = U"u_?.sbi";

	load_tile(' ', dir, U"space.sbi");
	for (uint id = 'a'; id <= 'z'; id++) {
		name[0] = id;
		load_tile(id, dir, name);
	}
	for (uint id = 'A'; id <= 'Z'; id++) {
		name_upper[2] = id;
		load_tile(id, dir, name_upper);
	}
	for (uint id = '0'; id <= '9'; id++) {
		name[0] = id;
		load_tile(id, dir, name);
	}
	load_tile(':', dir, U"2dot.sbi");
	load_tile('(', dir, U"(.sbi");
	load_tile(')', dir, U").sbi");
	load_tile('[', dir, U"[.sbi");
	load_tile(']', dir, U"].sbi");
	load_tile(';', dir, U"_dot_comma.sbi");
	load_tile('.', dir, U"_dot.sbi");
	load_tile('%', dir, U"_percent.sbi");
	load_tile('-', dir, U"-.sbi");
	load_tile(',', dir, U",.sbi");
	load_tile('!', dir, U"!.sbi");
	load_tile('?', dir, U"?.sbi");
	load_tile('/', dir, U"slash.sbi");
	load_tile('\\', dir, U"backslash.sbi");
	load_tile('\\', dir, U"backslash.sbi");
	load_tile('<', dir, U"Layer 1_alpha_82.sbi");
	load_tile('>', dir, U"Layer 1_alpha_83.sbi");
	load_tile('@', dir, U"Layer 1_alpha_85.sbi");
}

void load_game_tiles(uint dir) {
	char32_t name[7] = U"??.sbi";
	for (uint tileId = 0; tileId < 99; tileId++) {
		uint2str(tileId + 1, name, 2, '0');
	}
}

void load_all_tiles(uint img_dir) {
	load_alphabet_tiles(hdd_cd(img_dir, U"alphabet"));
	// load_game_tiles(hdd_cd(img_dir, U"map"));
}

/* Show tiles */

#define CHAR_SIZE 7

inline void show_screen_text(const char32_t* text, int x, int y, int width) {
	int real_x = x;
	int w = 0;
	while (*text) {
		setScreenPos(real_x, y);
		drawTexture((uint)*text);
		real_x += CHAR_SIZE;
		w++;
		if (w == width) {
			w = 0;
			real_x = x;
			y += CHAR_SIZE;
		}
		text++;
	}
}

#endif // TILES_HPP
