CXX=g++ -std=c++17
CPPFLAGS=-g -O2 -Wall -Wextra
SFML_FLAGS=-lsfml-graphics -lsfml-window -lsfml-system
LDFLAGS=
LDLIBS=
SRC_DIR=src
OBJ_DIR=obj

# SRCS=src/toplevel.cpp src/io.cpp
# SRCS=$(wildcard $(SRC_DIR)/*.cpp)
SRCS=$(shell find src -type f -name '*.cpp' ! -name 'run*.cpp' ! -name 'compile.cpp' ! -name 'comp_netlist_sim.cpp' ! -name 'sf_*.cpp')
SF_SRCS=$(shell find src -type f -name 'sf_*.cpp')
TARGET_SRCS=src/toplevel.cpp src/run.cpp src/compile.cpp src/runproc.cpp src/runclock.cpp __build__/proc.o src/netsim/comp_netlist_sim.o
OBJS=$(subst .cpp,.o,$(SRCS))
SF_OBJS=$(subst .cpp,.o,$(SF_SRCS))
TARGET_OBJS=$(subst .cpp,.o,$(TARGET_SRCS))
SIM_OBJ=src/netsim/comp_netlist_sim.o

all: toplevel run

# Compile main programs

compile: $(OBJS) src/compile.o
	$(CXX) $(LDFLAGS) -o compile $(OBJS) src/compile.o $(LDLIBS)

# Compile main processor

__build__/%.cpp: __build__/%.net
	mkdir -p __build__
	./compile $< $@

__build__/%.o: __build__/%.cpp
	$(CXX) $(CPPFLAGS) -c -o $@ $<

proc: $(OBJS) $(SF_OBJS) $(SIM_OBJ) compile __build__/proc.o src/runproc.o
	$(CXX) $(LDFLAGS) $(SFML_FLAGS) -o runproc __build__/proc.o $(OBJS) $(SIM_OBJ) $(SF_OBJS) src/runproc.o $(LDLIBS)

# Compile Clock processor

clock: $(OBJS) $(SIM_OBJ) compile __build__/proc_clock.o src/runclock.o
	$(CXX) $(LDFLAGS) -o runclock __build__/proc_clock.o $(OBJS) $(SIM_OBJ) src/runclock.o $(LDLIBS)

# Other stuff

clean:
	rm $(OBJS) $(SF_OBJS) $(TARGET_OBJS) __build__/proc.cpp compile run runclock runproc toplevel
