#include "periph.hpp"
#include <iostream>

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

std::string unicodeCharToString(uint charCode) {
	std::string out;
	if (charCode <= 0x7f) {
		out.append(1, (char)(charCode));
	}
	else if (charCode <= 0x7ff) {
		out.append(1, (char)(0xc0 | ((charCode >> 6) & 0x1f)));
		out.append(1, (char)(0x80 | (charCode & 0x3f)));
	}
	else if (charCode <= 0xffff) {
		out.append(1, (char)(0xe0 | ((charCode >> 12) & 0x0f)));
		out.append(1, (char)(0x80 | ((charCode >> 6) & 0x3f)));
		out.append(1, (char)(0x80 | (charCode & 0x3f)));
	}
	else {
		out.append(1, (char)(0xf0 | ((charCode >> 18) & 0x07)));
		out.append(1, (char)(0x80 | ((charCode >> 12) & 0x3f)));
		out.append(1, (char)(0x80 | ((charCode >> 6) & 0x3f)));
		out.append(1, (char)(0x80 | (charCode & 0x3f)));
	}
	return out;
}

void ConsoleOutDevice::send(uint value) {
	if (value) {
		// std::cout << unicodeCharToString(value) << " (" << value << ")\n";
		std::cout << unicodeCharToString(value);
	}
}

void ClockDevice::run() {

}
