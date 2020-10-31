CXX=g++ -std=c++17
CPPFLAGS=-O2 -Wall -Wextra
LDFLAGS=
LDLIBS=
SRC_DIR=src
OBJ_DIR=obj

# SRCS=src/toplevel.cpp src/io.cpp
# SRCS=$(wildcard $(SRC_DIR)/*.cpp)
SRCS=$(shell find src -type f -name '*.cpp' ! -name 'toplevel.cpp' ! -name 'run*.cpp' ! -name 'compile.cpp')
TARGET_SRCS=src/toplevel.cpp src/run.cpp src/compile.cpp src/runproc.cpp __build__/proc.o
OBJS=$(subst .cpp,.o,$(SRCS))
TARGET_OBJS=$(subst .cpp,.o,$(TARGET_SRCS))

all: toplevel run

toplevel: $(OBJS) src/toplevel.o
	$(CXX) $(LDFLAGS) -o toplevel $(OBJS) src/toplevel.o $(LDLIBS)

run: $(OBJS) src/run.o
	$(CXX) $(LDFLAGS) -o run $(OBJS) src/run.o $(LDLIBS)

compile: $(OBJS) src/compile.o
	$(CXX) $(LDFLAGS) -o compile $(OBJS) src/compile.o $(LDLIBS)

proccppfile:
	mkdir -p __build__
	./compile __build__/proc.net __build__/proc.cpp

proc: $(OBJS) compile proccppfile src/runproc.o __build__/proc.o
	$(CXX) $(LDFLAGS) -o runproc __build__/proc.o $(OBJS) src/runproc.o $(LDLIBS)

depend: .depend

.depend: $(SRCS) $(TARGET_SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	rm $(OBJS) $(TARGET_OBJS)
