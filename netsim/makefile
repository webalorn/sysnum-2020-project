CXX=g++ -std=c++17
CPPFLAGS=-O2 -Wall -Wextra
LDFLAGS=
LDLIBS=
SRC_DIR=src
OBJ_DIR=obj

# SRCS=src/toplevel.cpp src/io.cpp
# SRCS=$(wildcard $(SRC_DIR)/*.cpp)
SRCS=$(shell find src -type f -name '*.cpp' ! -name 'toplevel.cpp' ! -name 'run*.cpp' ! -name 'compile.cpp' ! -name 'comp_netlist_sim.cpp')
TARGET_SRCS=src/toplevel.cpp src/run.cpp src/compile.cpp src/runproc.cpp src/runclock.cpp __build__/proc.o src/netsim/comp_netlist_sim.o
OBJS=$(subst .cpp,.o,$(SRCS))
TARGET_OBJS=$(subst .cpp,.o,$(TARGET_SRCS))
SIM_OBJ=src/netsim/comp_netlist_sim.o

all: toplevel run

# Compile main programs

toplevel: $(OBJS) src/toplevel.o
	$(CXX) $(LDFLAGS) -o toplevel $(OBJS) src/toplevel.o $(LDLIBS)

run: $(OBJS) src/run.o
	$(CXX) $(LDFLAGS) -o run $(OBJS) src/run.o $(LDLIBS)

compile: $(OBJS) src/compile.o
	$(CXX) $(LDFLAGS) -o compile $(OBJS) src/compile.o $(LDLIBS)

# Compile main processor

__build__/%.cpp: __build__/%.net
	mkdir -p __build__
	./compile $< $@

__build__/%.o: __build__/%.cpp
	$(CXX) $(CPPFLAGS) -c -o $@ $<

proc: $(OBJS) $(SIM_OBJ) compile __build__/proc.o src/runproc.o
	$(CXX) $(LDFLAGS) -o runproc __build__/proc.o $(OBJS) $(SIM_OBJ) src/runproc.o $(LDLIBS)

# Compile Clock processor

clock: $(OBJS) $(SIM_OBJ) compile __build__/proc_clock.o src/runclock.o
	$(CXX) $(LDFLAGS) -o runclock __build__/proc_clock.o $(OBJS) $(SIM_OBJ) src/runclock.o $(LDLIBS)

# Other stuff

clean:
	rm $(OBJS) $(TARGET_OBJS) __build__/proc.cpp
