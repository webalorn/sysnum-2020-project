CXX=clang --target=riscv32 -std=c++17 -fno-exceptions
CXX_I=$(CXX) -march=rv32i
LIB_HPP=$(wildcard slib/*.hpp)
APP_HPP=$(wildcard app/*.hpp)

all: prepare build/boot.s build/clock.s build/main.s build/clock_fast.s build/screen_clock.s build/mul.s

prepare:
	mkdir -p build

build/boot.s: boot.cpp
	$(CXX_I) -O2 -S boot.cpp -o build/boot.s

build/main.s: main.cpp $(LIB_HPP) $(APP_HPP)
	$(CXX_I) -O2 -S main.cpp -o build/main.s

# This file don't use O2 to force using the mul / div operations
build/mul.s: mul.cpp $(LIB_HPP) $(APP_HPP)
	$(CXX) -march=rv32im -S mul.cpp -o build/mul.s

build/clock.s: clock.cpp
	$(CXX_I) -O1 -S clock.cpp -o build/clock.s

build/clock_fast.s: clock.cpp
	$(CXX_I) -O2 -S clock.cpp -DFAST=1 -o build/clock_fast.s

build/screen_clock.s: screen_clock.cpp $(LIB_HPP)
	$(CXX) -O2 -S screen_clock.cpp -o build/screen_clock.s

clean:
	rm -R build
