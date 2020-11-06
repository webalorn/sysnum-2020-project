CXX=clang --target=riscv32 -march=rv32i -std=c++17
LIB_HPP=$(wildcard slib/*.hpp)
GAME_HPP=$(wildcard game/*.hpp)

all: prepare build/boot.s build/clock.s build/main.s build/clock_fast.s build/screen_clock.s

prepare:
	mkdir -p build

build/boot.s: boot.cpp
	$(CXX) -O2 -S boot.cpp -o build/boot.s

build/main.s: main.cpp $(LIB_HPP) $(GAME_HPP)
	$(CXX) -O2 -S main.cpp -o build/main.s

build/clock.s: clock.cpp
	$(CXX) -O1 -S clock.cpp -o build/clock.s

build/clock_fast.s: clock.cpp
	$(CXX) -O2 -S clock.cpp -DFAST=1 -o build/clock_fast.s

build/screen_clock.s: screen_clock.cpp $(LIB_HPP)
	$(CXX) -O2 -S screen_clock.cpp -o build/screen_clock.s
