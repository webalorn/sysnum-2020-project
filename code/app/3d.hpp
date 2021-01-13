#include "app.hpp"

struct Vect2d {
	int x, y;
};

struct Vect {
	int x, y, z;
	Vect(int x, int y, int z) : x(x), y(y), z(z) {}
	Vect() {}
};
using Point = Vect;

Vect operator+(const Vect& a, const Vect& b) {
	return Vect(a.x + b.x, a.y + b.y, a.z + b.z);
}
Vect operator-(const Vect& a, const Vect& b) {
	return Vect(a.x - b.x, a.y - b.y, a.z - b.z);
}
int dot(const Vect& a, const Vect& b) {
	return a.x * b.x + a.y * b.y + a.z * b.z;
}

struct Triangle {
	Point a, b, c, center3;
	Triangle(Point a, Point b, Point c) : a(a), b(b), c(c) {
		computeCenter();
	}
	void computeCenter() {
		center3 = Point((a.x + b.x + c.x),
			(a.y + b.y + c.y), (a.z + b.z + c.z));
	}
	Triangle() {}
};

// Geometry

#define MAX_TRIANGLES 10
Triangle triangleArray[MAX_TRIANGLES];

Point cameraPos;
Vect cameraVect;
Vect origin;

void initGeometry() {
	cameraPos = Point(-64, 0, 0);
	cameraVect = Vect(64, 0, 0);
	origin = Vect(0, 0, 0);
}

Vect2d projOnScreen(const Point& p) {
	Vect line = p - cameraPos;
	int divide = dot(line, cameraVect);
	if (divide == 0) {
		return { p.x, p.y };
	}
	int d = dot(origin - cameraPos, cameraVect);
	Vect2d proj{
		HALF_SCREEN + line.y * d / divide,
		HALF_SCREEN - line.z * d / divide,
	};
	return proj;
}

void draw(const Triangle& tri, uint red, uint green, uint blue) {
	Vect2d a = projOnScreen(tri.a);
	Vect2d b = projOnScreen(tri.b);
	Vect2d c = projOnScreen(tri.c);
	drawFullTriangle(a.x, a.y, b.x, b.y, c.x, c.y, red, green, blue);
}

bool operator<(const Triangle& a, const Triangle& b) {
	return dot(a.center3, cameraPos) < dot(b.center3, cameraPos);
}

void sortTriangles(Triangle* triangles, uint* triOrder, int n) {
	if (n > 1) {
		uint* center = triOrder + (n >> 1);

		swap(*center, *triOrder);
		uint* lower_end = triOrder;
		for (uint* pt = triOrder + 1; pt != triOrder + n; pt++) {
			if (triangles[*pt] < triangles[*lower_end]) {
				uint* lower_end_next = lower_end + 1;
				if (pt != lower_end_next) {
					swap(*lower_end_next, *pt);
				}
				swap(*lower_end, *lower_end_next);
				lower_end++;
			}
		}
		sortTriangles(triangles, triOrder, lower_end - triOrder);
		sortTriangles(triangles, lower_end + 2, triOrder + n - lower_end - 2);
	}
}

int cos32_compute(int a) {
	// const float c1 = 0.99940307;
	// const float c2 = -0.459558072;
	// const float c3 = 0.03679168;
	// float x2 = x * x;
	// return (c1 + x2 * (c2 + c3 * x2));
	/* const int c1 = 999;
	const int c2 = -459;
	const int c3 = 36;
	const int div = 3283;
	int x2 = a * a;
	return (c1 + (x2 * (c2 + (c3 * x2) / div)) / div); */
	// const int c1 = 99940;
	// const int c2 = -45955;
	// const int c3 = 3679;
	// const int div = 3283;
	// int x2 = a * a;
	// return (c1 + (x2 * (c2 + (c3 * x2) / div)) / div) / 100;

	const int c1 = 65496;
	const int c2 = -30117;
	const int c3 = 2411;
	const int div = 3283;
	int x2 = a * a;
	return (c1 + (x2 * (c2 + (c3 * x2) / div)) / div) >> 6;
}

int cos32(int a) {
	if (a < 0) return cos32(a + 360);
	if (a > 360) return cos32(a - 360);
	if (a > 270) return cos32_compute(360 - a);
	if (a > 180) return -cos32_compute(a - 180);
	if (a > 90) return -cos32_compute(180 - a);
	return cos32_compute(a);
}
int sin32(int a) {
	return cos32(90 - a);
}

inline void rotatePoint(Point& dest, const Point& center, const Point& p, int cos_val, int sin_val) {
	int x = p.x - center.x;
	int y = p.y - center.y;
	dest.x = center.x + ((x * cos_val - y * sin_val) >> 10);
	dest.y = center.y + ((x * sin_val + y * cos_val) >> 10);
	dest.z = p.z;
}

void applyRotation(Triangle* source, Triangle* dest, uint n, Point center, int angle) {
	int cos_val = cos32(angle);
	int sin_val = sin32(angle);
	for (;n;n--, source++, dest++) {
		rotatePoint(dest->a, center, source->a, cos_val, sin_val);
		rotatePoint(dest->b, center, source->b, cos_val, sin_val);
		rotatePoint(dest->c, center, source->c, cos_val, sin_val);
		dest->computeCenter();
	}
}

void drawTriangles(Triangle* triangles, uint n) {
	for (; n; n--, triangles++) {
		draw(*triangles, 255, 0, 0);
	}
	refreshScreen();
}

// Scenes

void run3dScene() {
	// setScreenPos(10, 10);
	initGeometry();

	const uint X = 200;
	// Triangle tris[2] = {
	// 	Triangle(Point(X + 80, -100, 0), Point(X + 60, 120, 120), Point(X + 80, 0, 0)),
	// 	Triangle(Point(X + 200, 100, 0), Point(X + 100, 0, 100), Point(X + 100, 0, 0)),
	// };
	Triangle tris[2] = {
		Triangle(Point(X + 210, -100, 0), Point(X + 210, 120, 120), Point(X + 210, 0, 0)),
		Triangle(Point(X + 200, 100, 0), Point(X + 200, 0, 100), Point(X + 200, 0, 0)),
	};
	uint triOrder[2] = { 0, 1 };

	uint n = 2;
	Point center(X + 200, 0, 0);

	int angle = 0;
	while (true) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (key == KEY_ESCAPE) {
				return;
			}
		}
		// if (app->needToDraw()) {
		if (true) {
			angle += 10;
			if (angle >= 360) {
				angle -= 360;
			}

			applyRotation(tris, triangleArray, n, center, angle);
			// drawTriangles(triangleArray, n);

			sortTriangles(triangleArray, triOrder, n);
			draw(triangleArray[triOrder[0]], 255, 0, 0);
			draw(triangleArray[triOrder[1]], 147, 112, 219);
			refreshScreen();
		}

		// Triangle tri1(Point(500, -200, 250), Point(500, 400, 250), Point(500, 100, -200));
		// Triangle tri1(Point(500, -200, 250), Point(500, 400, 250), Point(0, 0, 0));

		// drawFullTriangle(10, 10, 60, 10, 10, 60, 255, 0, 0);
		// refreshScreen();

		// drawFullTriangle(10, 10, 10, 60, 60, 10, 0, 255, 0);
		// refreshScreen();

		// drawFullTriangle(10, 10, 60, 10, 30, 30, 0, 0, 255);
		// refreshScreen();
	}
}
