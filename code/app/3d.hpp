#include "app.hpp"

struct Vect2d {
	int x, y;
};

struct Vect {
	int x, y, z;
	Vect(int x, int y, int z) : x(x), y(y), z(z) {}
	Vect() {}
	inline void move(int dx, int dy, int dz) {
		x += dx;
		y += dy;
		z += dz;
	}
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
	Point a, b, c;//, center3;
	int center3;
	Triangle(Point a, Point b, Point c) : a(a), b(b), c(c) {
		computeCenter();
	}
	inline void computeCenter() {
		// center3 = Point((a.x + b.x + c.x),
		// 	(a.y + b.y + c.y), (a.z + b.z + c.z));
		center3 = a.x + b.x + c.x;
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
	int linex = p.x + 64;
	if (linex == 0) {
		return { p.x, p.y };
	}
	return {
		HALF_SCREEN + (p.y << 6) / linex,
		HALF_SCREEN - (p.z << 6) / linex,
	};
}

void draw(const Triangle& tri, uint red, uint green, uint blue) {
	const Vect2d a = projOnScreen(tri.a);
	const Vect2d b = projOnScreen(tri.b);
	const Vect2d c = projOnScreen(tri.c);
	drawFullTriangle(a.x, a.y, b.x, b.y, c.x, c.y, red, green, blue);
}

// bool operator<(const Triangle& a, const Triangle& b) {
// 	return a.center3 < b.center3;
// 	// return dot(a.center3, cameraPos) < dot(b.center3, cameraPos);
// }

void sortTriangles(Triangle* triangles, uint* triOrder, int n) {
	if (n > 1) {
		uint* center = triOrder + (n >> 1);

		swap(*center, *triOrder);
		uint* lower_end = triOrder;
		for (uint* pt = triOrder + 1; pt != triOrder + n; pt++) {
			if (triangles[*pt].center3 < triangles[*lower_end].center3) {
				uint* lower_end_next = lower_end + 1;
				if (pt != lower_end_next) {
					swap(*lower_end_next, *pt);
				}
				swap(*lower_end, *lower_end_next);
				lower_end++;
			}
		}
		sortTriangles(triangles, triOrder, lower_end - triOrder);
		sortTriangles(triangles, lower_end + 1, triOrder + n - lower_end - 1);
	}
}

int cos32_compute(int a) {
	// c1 ~= 0.99940307;
	// c2 ~= -0.459558072;
	// c3 ~= 0.03679168;
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

uint getLight(const Triangle& tri) {
	int x_min = tri.a.x, y_min = tri.a.y;
	int x_max = tri.a.x, y_max = tri.a.y;

	if (tri.b.x < x_min) x_min = tri.b.x, y_min = tri.b.y;
	if (tri.b.x > x_max) x_max = tri.b.x, y_max = tri.b.y;
	if (tri.c.x < x_min) x_min = tri.c.x, y_min = tri.c.y;
	if (tri.c.x > x_max) x_max = tri.c.x, y_max = tri.c.y;

	int x = x_max - x_min;
	int y = y_max - y_min;

	uint quad_x = x * x;
	uint quad_y = y * y;
	if (quad_x || quad_y) {
		int light = (250 * quad_y) / (quad_x + quad_y);
		return 55 + min(light, 200);
	}
	return 255;
}

void drawTriangles(const Triangle* triangles, const uint* triOrder, uint n) {
	for (int i = n - 1; i >= 0; i--) {
		const Triangle& tri = triangles[triOrder[i]];
		int c = getLight(tri);
		if (triOrder[i] < 4) {
			draw(tri, c, 0, 0);
		}
		else if (triOrder[i] < 8) {
			draw(tri, 0, c, 0);
		}
		else {
			draw(tri, 0, 0, c);
		}
	}
}

void applyMove(Triangle* triangles, uint n, int x, int y, int z) {
	for (; n; n--, triangles++) {
		triangles->a.move(x, y, z);
		triangles->b.move(x, y, z);
		triangles->c.move(x, y, z);
	}
}

// Scenes



void run3dSceneObject(Triangle* tris, Point center, uint* triOrder, uint n) {
	initGeometry();

	int angle = 45;
	bool rotate = true;
	const int step = 25;
	int rotationStep = 10;

	int backR = 100;
	int backG = 220;
	int backB = 140;
	int colorOffset = 0;
	int colorMove = 5;

	while (true) {
		app->loop();
		while (app->hasEvent()) {
			uint key = app->getEvent();
			if (key == KEY_ESCAPE) {
				return;
			}
			else if (key == KEY_SPACE) {
				rotate = !rotate;
			}
			else if (key == KEY_LEFT) {
				applyMove(tris, n, 0, -step, 0);
				center.move(0, -step, 0);
			}
			else if (key == KEY_RIGHT) {
				applyMove(tris, n, 0, step, 0);
				center.move(0, step, 0);
			}
			else if (key == KEY_DOWN) {
				applyMove(tris, n, 0, 0, -step);
				center.move(0, 0, -step);
			}
			else if (key == KEY_UP) {
				applyMove(tris, n, 0, 0, step);
				center.move(0, 0, step);
			}
			else if (key == 9) { // I
				rotationStep = -rotationStep;
			}
		}
		if (app->needToDraw()) {
			if (rotate) {
				angle += rotationStep;
				if (angle >= 360) {
					angle -= 360;
				}
				else if (angle < 0) {
					angle += 360;
				}
			}
			colorOffset += colorMove;
			if (colorOffset <= -30) {
				colorMove = 5;
			}
			else if (colorOffset >= 30) {
				colorMove = -5;
			}

			setScreenPos(0, 0);
			setScreenColor(backR + colorOffset, backB + colorOffset, backG);
			drawRectangle(SCREEN_W, SCREEN_H);

			applyRotation(tris, triangleArray, n, center, angle);
			sortTriangles(triangleArray, triOrder, n);
			drawTriangles(triangleArray, triOrder, n);
			refreshScreen();
		}
	}
}

void run3dCube() {
	// setScreenPos(10, 10);

	const int X = 400;
	const int C = 100;
	const int Z = -40;
	const uint n = 8;

	Point p1(X - C, -C, Z + C);
	Point p2(X - C, C, Z + C);
	Point p3(X - C, C, Z - C);
	Point p4(X - C, -C, Z - C);
	Point p5(X + C, -C, Z + C);
	Point p6(X + C, C, Z + C);
	Point p7(X + C, C, Z - C);
	Point p8(X + C, -C, Z - C);

	Triangle tris[n] = {
		Triangle(p1, p2, p4),
		Triangle(p2, p3, p4),
		Triangle(p5, p6, p8),
		Triangle(p6, p7, p8),
		Triangle(p2, p6, p3),
		Triangle(p3, p6, p7),
		Triangle(p1, p4, p8),
		Triangle(p1, p8, p5),
	};
	uint triOrder[n] = { 0, 1, 2, 3, 4, 5, 6, 7 };
	Point center(X, 0, 0);
	run3dSceneObject(tris, center, triOrder, n);
}

void run3dDiamond() {
	// setScreenPos(10, 10);

	const uint n = 12;
	const int X = 400;
	const int Z = -40;

	const int R = 100;
	const int R_LO = R >> 1;
	const int R_HI = 87;
	const int H = 200;

	Point p_top(X, 0, Z + H);
	Point p_bottom(X, 0, Z - H);
	Point p1(X, R, Z);
	Point p2(X + R_HI, R_LO, Z);
	Point p3(X + R_HI, -R_LO, Z);
	Point p4(X, -R, Z);
	Point p5(X - R_HI, -R_LO, Z);
	Point p6(X - R_HI, R_LO, Z);

	Triangle tris[n] = {
		Triangle(p_top, p1, p2), // hi 1
		Triangle(p_top, p4, p5), // hi 4
		Triangle(p_bottom, p2, p3), // lo 2
		Triangle(p_bottom, p5, p6), // lo 5

		Triangle(p_top, p2, p3), // hi 2
		Triangle(p_top, p5, p6), // hi 5
		Triangle(p_bottom, p3, p4), // lo 3
		Triangle(p_bottom, p6, p1), // lo 6

		Triangle(p_top, p3, p4), // hi 3
		Triangle(p_top, p6, p1), // hi 6
		Triangle(p_bottom, p1, p2), // lo 1
		Triangle(p_bottom, p4, p5), // lo 4
	};
	uint triOrder[n] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
	Point center(X, 0, 0);
	run3dSceneObject(tris, center, triOrder, n);
}

void run3dDiamondDiag() {
	// setScreenPos(10, 10);

	const uint n = 12;
	const int X = 500;
	const int Z = -40;

	const int R = 100;
	const int R_LO = R >> 1;
	const int R_HI = 75;
	const int H = 200;
	const int Z_MOD_LO = 43;
	const int H_MOD = 173;
	const int X_HI = 100;

	Point p_top(X + X_HI, 0, Z + H_MOD);
	Point p_bottom(X - X_HI, 0, Z - H_MOD);
	Point p1(X, R, Z);
	Point p2(X + R_HI, R_LO, Z - Z_MOD_LO);
	Point p3(X + R_HI, -R_LO, Z - Z_MOD_LO);
	Point p4(X, -R, Z);
	Point p5(X - R_HI, -R_LO, Z + Z_MOD_LO);
	Point p6(X - R_HI, R_LO, Z + Z_MOD_LO);

	Triangle tris[n] = {
		Triangle(p_top, p1, p2), // hi 1
		Triangle(p_top, p4, p5), // hi 4
		Triangle(p_bottom, p2, p3), // lo 2
		Triangle(p_bottom, p5, p6), // lo 5

		Triangle(p_top, p2, p3), // hi 2
		Triangle(p_top, p5, p6), // hi 5
		Triangle(p_bottom, p3, p4), // lo 3
		Triangle(p_bottom, p6, p1), // lo 6

		Triangle(p_top, p3, p4), // hi 3
		Triangle(p_top, p6, p1), // hi 6
		Triangle(p_bottom, p1, p2), // lo 1
		Triangle(p_bottom, p4, p5), // lo 4
	};
	uint triOrder[n] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
	Point center(X, 0, 0);
	run3dSceneObject(tris, center, triOrder, n);
}

void run3dScene() {
	run3dCube();
	run3dDiamond();
	run3dDiamondDiag();
}
