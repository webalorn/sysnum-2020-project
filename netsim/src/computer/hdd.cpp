#include "hdd.hpp"
#include <bitset> // REMOVE

VirtualDrive::VirtualDrive(std::string path) : disk(path, std::ios::binary), hold_value(0) {}

void VirtualDrive::moveTo(uint addr) {
	// Should probably be a multiple of 4, if correctly 32-bits aligned
	disk.seekg((std::streampos)addr);
	disk.read(buffer, 4);
	unsigned char a = buffer[0], b = buffer[1], c = buffer[2], d = buffer[3];
	hold_value = ((uint)a << (3 * 8)) + ((uint)b << (2 * 8))
		+ ((uint)c << 8) + (uint)d;
}
uint VirtualDrive::getCurrentValue() {
	return hold_value;
}


DriveOutput::DriveOutput(VirtualDrive& driveObj) : drive(driveObj) {}
void DriveOutput::send(uint addr) {
	if (addr) { // Don't move if there is no signal
		drive.moveTo(addr);
	}
}

DriveInput::DriveInput(VirtualDrive& driveObj) : drive(driveObj) {}
void DriveInput::run() {}
void DriveInput::pop() {}
uint DriveInput::getSignal() {
	return drive.getCurrentValue();
}
