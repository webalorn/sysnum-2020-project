#if !defined(PERIPH_HPP)
#define PERIPH_HPP

#include <deque>
#include "../netsim/netlist.hpp"

class ProcInQueue {
protected:
	int maxSize;
	std::deque<uint> events;

public:
	ProcInQueue(int maxSize = 10);
	void push(uint);
	void pop();
	uint front();
};

class InputDevice {
protected:
	ProcInQueue inQueue;
public:
	virtual void run() = 0;
	virtual void pop();
	virtual uint getSignal();
};

class OutputDevice {
public:
	virtual void send(uint) = 0;
};

/* Some devides */

class ConsoleOutDevice : public OutputDevice {
protected:
	uint flushCounter;
	bool hasChar;
public:
	ConsoleOutDevice();
	virtual void send(uint);
};

class ClockDevice : public InputDevice {
protected:
	time_t lastTick;
public:
	virtual void run();
	ClockDevice();
};

class OctoClockDevice : public InputDevice {
protected:
	uint64_t lastTick;
	uint64_t getTimeMilli();
	static const int TIME_INTERVAL = 1000 * 1000 / 8;
public:
	virtual void run();
	OctoClockDevice();
};

class InitTimeDevice : public InputDevice {
public:
	virtual void run();
	InitTimeDevice();
};

#endif // PERIPH_HPP
