#include "slib/slib.hpp"
#include "slib/iostream.hpp"
#include "slib/vector.hpp"
#include "slib/algorithm.hpp"
#include "slib/string.hpp"
#include "slib/hdd.hpp"
#include "slib/screen.hpp"
#include "app/tiles.hpp"

int main() {
	initMemManager();

	cout << U"Clock on screen 🕰\n";
	uint root = hdd_root();
	// uint images_path = hdd_cd(root, U"images");

	cout << "Loading sprites...\n";
	// load_alphabet_tiles(hdd_cd(images_path, U"alphabet"));
	load_alphabet_tiles(root);
	cout << "Done\n";

	show_screen_text(U"Hello there !", 0, 0, 6);

	refreshScreen();

	uint s0 = '0', s1 = '0', m0 = '0', m1 = '0', h0 = '0', h1 = '0';
	char32_t time_str[9] = U"00:00:00";
	while (1) {

		s0++;
		if (s0 == ':') {
			s0 = '0';
			s1++;
			if (s1 == '6') {
				s1 = '0';
				m0++;
				if (m0 == ':') {
					m0 = '0';
					m1++;
					if (m1 == '6') {
						m1 = '0';
						h0++;
						if (h0 == ':') {
							h1++;
							h0 = '0';
						}
						if (h0 == '4' && h1 == '2') {
							// *out_addr = 1;
							h0 = '0';
							h1 = '0';
						}
					}
				}
			}
		}
		time_str[0] = h1;
		time_str[1] = h0;
		time_str[3] = m1;
		time_str[4] = m0;
		time_str[6] = s1;
		time_str[7] = s0;
		show_screen_text(time_str, 22, 46, 14);
		refreshScreen();
	}
}
