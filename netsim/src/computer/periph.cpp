#include "periph.hpp"
#include <iostream>
#include <ctime>
#include <chrono>

ProcInQueue::ProcInQueue(int maxSizeVal) {
	maxSize = maxSizeVal;
}
void ProcInQueue::push(uint value) {
	events.push_back(value);
	if (maxSize >= 0 && (int)events.size() > maxSize) {
		events.pop_front();
	}
}
void ProcInQueue::pop() {
	if (events.size()) {
		events.pop_front();
	}
}
uint ProcInQueue::front() {
	if (events.empty()) {
		return 0;
	}
	return events.front();
}

/* Virtual base functions */

void InputDevice::pop() {
	inQueue.pop();
}
uint InputDevice::getSignal() {
	return inQueue.front();
}

/* Some devices */

inline void printUnicode(uint charCode) {
	if (charCode <= 0x7f) {
		std::cout << (char)(charCode);
	}
	else if (charCode <= 0x7ff) {
		std::cout << (char)(0xc0 | ((charCode >> 6) & 0x1f));
		std::cout << (char)(0x80 | (charCode & 0x3f));
	}
	else if (charCode <= 0xffff) {
		std::cout << (char)(0xe0 | ((charCode >> 12) & 0x0f));
		std::cout << (char)(0x80 | ((charCode >> 6) & 0x3f));
		std::cout << (char)(0x80 | (charCode & 0x3f));
	}
	else {
		std::cout << (char)(0xf0 | ((charCode >> 18) & 0x07));
		std::cout << (char)(0x80 | ((charCode >> 12) & 0x3f));
		std::cout << (char)(0x80 | ((charCode >> 6) & 0x3f));
		std::cout << (char)(0x80 | (charCode & 0x3f));
	}
}

ConsoleOutDevice::ConsoleOutDevice() {
	hasChar = false;
	flushCounter = true;
}

void ConsoleOutDevice::send(uint value) {
	if (value) {
		printUnicode(value);
		hasChar = true;
	}
	if (hasChar) {
		flushCounter += 1;
		if (flushCounter > 10000) {
			std::cout << std::flush;
			flushCounter = 0;
		}
	}
}

// Clock

ClockDevice::ClockDevice() {
	lastTick = std::time(nullptr);
}

void ClockDevice::run() {
	if (std::time(nullptr) > lastTick) {
		inQueue.push(1);
		lastTick++;
	}
}

// OctoClock (a tic every 1/8 s)

OctoClockDevice::OctoClockDevice() {
	lastTick = getTimeMilli();
}

uint64_t OctoClockDevice::getTimeMilli() {
	using namespace std::chrono;
	return duration_cast<microseconds>(system_clock::now().time_since_epoch()).count();
}

void OctoClockDevice::run() {
	if (getTimeMilli() > lastTick + TIME_INTERVAL) {
		inQueue.push(1);
		lastTick += TIME_INTERVAL;
	}
}

// Init time


InitTimeDevice::InitTimeDevice() {
	std::time_t t = std::time(0);
	// std::tm* now = std::localtime(&t);
	// uint today_secs = now->tm_sec + 60 * (now->tm_min + 60 * now->tm_hour);
	uint local_secs = t;
	inQueue.push(local_secs);
}

void InitTimeDevice::run() {}
