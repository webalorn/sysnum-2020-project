CXX=g++ -std=c++17
CPPFLAGS=-g -pthread -I/sw/include/root
LDFLAGS=-g
LDLIBS=
SRC_DIR=src
OBJ_DIR=obj

# SRCS=src/toplevel.cpp src/io.cpp
# SRCS=$(wildcard $(SRC_DIR)/*.cpp)
SRCS=$(shell find src -type f -name '*.cpp')
OBJS=$(subst .cpp,.o,$(SRCS))

all: toplevel

toplevel: $(OBJS)
	$(CXX) $(LDFLAGS) -o toplevel $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	rm $(OBJS)
