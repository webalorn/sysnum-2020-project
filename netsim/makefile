CXX=g++ -std=c++17
CPPFLAGS=-g -pthread -O2 -Wall -Wextra # -fsanitize=address # only on debug
LDFLAGS=-g
LDLIBS=
SRC_DIR=src
OBJ_DIR=obj

# SRCS=src/toplevel.cpp src/io.cpp
# SRCS=$(wildcard $(SRC_DIR)/*.cpp)
SRCS=$(shell find src -type f -name '*.cpp' ! -name 'toplevel.cpp' ! -name 'run.cpp')
TARGET_SRCS=src/toplevel.cpp src/run.cpp
OBJS=$(subst .cpp,.o,$(SRCS))
TARGET_OBJS=$(subst .cpp,.o,$(TARGET_SRCS))

all: toplevel run

toplevel: $(OBJS) src/toplevel.o
	$(CXX) $(LDFLAGS) -o toplevel $(OBJS) src/toplevel.o $(LDLIBS)

run: $(OBJS) src/run.o
	$(CXX) $(LDFLAGS) -o run $(OBJS) src/run.o $(LDLIBS)

depend: .depend

.depend: $(SRCS) $(TARGET_SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	rm $(OBJS) $(TARGET_OBJS)
