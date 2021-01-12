#define DIV_EXT
#define MUL_EXT
#include "slib/slib.hpp"
#include "slib/iostream.hpp"

void show_result(int x, int y) {
	cout << x << '*' << y << " = " << (x * y) << "\n";
	if (y) {
		cout << x << '/' << y << " = " << (x / y) << "\n";
		cout << x << '%' << y << " = " << (x % y) << "\n";
	}
}


void show_result_u(uint x, uint y) {
	cout << x << '*' << y << " = " << (x * y) << "\n";
	if (y) {
		cout << x << '/' << y << " = " << (x / y) << "\n";
		cout << x << '%' << y << " = " << (x % y) << "\n";
	}
}

int main() {
	// initMemManager();

	show_result_u(20, 5);
	show_result(20, 6);
	show_result(-20, 6);
	show_result(20, -6);
	show_result(-20, -6);
	show_result_u(-20, -6);
}
