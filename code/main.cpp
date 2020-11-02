#include "slib/slib.hpp"
#include "slib/iostream.hpp"
#include "slib/vector.hpp"
#include "slib/algorithm.hpp"
#include "slib/string.hpp"
#include "slib/hdd.hpp"


int main() {
	initMemManager();

	cout << U"Hello there! 🐙\n";

	string s1("This is");
	string s2(U"not the droids you are looking for 🤖");
	uint a = 120, b = 9;

	cout << s1 << ' ' << s2 << "\n";
	cout << a % b << '\n';
	return 0;

	uint root = hdd_root();
	cout << root << "\n";

	uint file = hdd_cd(root, "test1.txt");
	uint dir = hdd_cd(root, "sub");
	uint file2 = hdd_cd(dir, "general.txt");

	File f(file2);
	cout << '"' << read_utf8(f) << "\"\n";

	cout << file << "\n";
	cout << dir << "\n";
}
