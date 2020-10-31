#if !defined(HDD_HPP)
#define HDD_HPP

#include <string>
#include <iostream>
#include <fstream>
#include "periph.hpp"

class VirtualDrive {
	std::ifstream disk;
	uint hold_value;
	char buffer[4];
public:
	VirtualDrive(std::string path);
	void moveTo(uint addr);
	uint getCurrentValue();
};

class DriveOutput : public OutputDevice {
	VirtualDrive& drive;
public:
	DriveOutput(VirtualDrive& driveObj);
	virtual void send(uint);
};

class DriveInput : public InputDevice {
	VirtualDrive& drive;
public:
	DriveInput(VirtualDrive& driveObj);
	virtual void run();
	virtual void pop();
	virtual uint getSignal();
};

#endif // HDD_HPP
