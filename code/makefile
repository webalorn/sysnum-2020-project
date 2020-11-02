CXX=clang --target=riscv32 -march=rv32i -std=c++17
LIB_HPP=$(wildcard slib/*.hpp)

all: prepare build/boot.s build/clock.s build/main.s build/clock_fast.s

prepare:
	mkdir -p build

build/boot.s: boot.cpp
	$(CXX) -O2 -S boot.cpp -o build/boot.s

build/main.s: main.cpp $(LIB_HPP)
	$(CXX) -O2 -S main.cpp -o build/main.s

build/clock.s: clock.cpp
	$(CXX) -O1 -S clock.cpp -o build/clock.s

build/clock_fast.s: clock.cpp
	$(CXX) -O2 -S clock.cpp -DFAST=1 -o build/clock_fast.s
