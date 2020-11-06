#if !defined(HDD_HPP)
#define HDD_HPP

#include "slib.hpp"
#include "iostream.hpp"
#include "string.hpp"

uint hdd_cd(uint pos, const char32_t* name) {
	uint reqNameSize = strlen(name);
	uint nbSubs = read_drive(pos + 4);
	pos += 8;
	for (int iSub = 0; iSub < nbSubs; iSub++) {
		uint filePos = read_drive(pos);
		uint nameSize = read_drive(pos + 4);
		pos += 8;
		bool isEq = reqNameSize == nameSize;
		for (int iNameChar = 0; iNameChar < nameSize; iNameChar++) {
			isEq = isEq && (read_drive(pos) == name[iNameChar]);
			pos += 4;
		}
		if (isEq) {
			return filePos;
		}
	}
	return 0;
}

uint hdd_root() {
	return read_drive(4) + 16; // 16 -> headers of the 2 sections
}

class File : public IStream {
protected:
	uint posCur, posEnd;
public:
	File(uint pos) {
		posCur = pos + 8;
		posEnd = posCur + read_drive(pos + 4); // posCur + size
	}
	inline bool eof() {
		return posCur >= posEnd;
	}
	inline uint size() {
		return eof() ? 0 : posEnd - posCur;
	}
	inline uint readWord() {
		uint word = read_drive(posCur);
		posCur += 4;
		return word;
	}
	inline char readByte() {
		uint word = read_drive(posCur);
		posCur += 1;
		char byte = word >> 24;
		return byte;
	}
	void readBuffer(char* buffer, uint n) {
		while (n > 0) {
			*buffer = read_drive(posCur);
			buffer++;
			n--;
			posCur += 4;
		}
	}
	inline uint peekWord() {
		return read_drive(posCur);
	}
	inline void move(int offset) {
		posCur += offset;
	}
};

File& operator>>(File& is, uint& v) {
	v = is.readWord();
	return is;
}

int numberOfBytesInChar(unsigned char val) {
	if (val < 128) {
		return 1;
	}
	else if (val < 224) {
		return 2;
	}
	else if (val < 240) {
		return 3;
	}
	else {
		return 4;
	}
}

string read_utf8(File& file) {
	string text;
	text.reserve(file.size());
	while (!file.eof()) {
		uint byte = file.readByte();
		if (byte >= 240) {
			byte = byte & 0b11111;
			byte = (byte << 6) + (file.readByte() & 0b111111);
			byte = (byte << 6) + (file.readByte() & 0b111111);
			byte = (byte << 6) + (file.readByte() & 0b111111);
		}
		else if (byte >= 224) {
			byte = byte & 0b1111;
			byte = (byte << 6) + (file.readByte() & 0b111111);
			byte = (byte << 6) + (file.readByte() & 0b111111);
		}
		else if (byte >= 128) {
			byte = byte & 0b111;
			byte = (byte << 6) + (file.readByte() & 0b111111);
		}
		if (byte) {
			text.push_back(byte);
		}
	}
	return text;
}

// void show_files(uint pos) {
// 	uint nbSubs = read_drive(pos + 4);
// 	pos += 8;
// 	for (int iSub = 0; iSub < nbSubs; iSub++) {
// 		uint filePos = read_drive(pos);
// 		uint nameSize = read_drive(pos + 4);
// 		cout << "File at " << filePos << " and name " << nameSize << '\n';
// 		pos += 8;
// 		string m;
// 		for (int iNameChar = 0; iNameChar < nameSize; iNameChar++) {
// 			m.push_back(read_drive(pos));
// 			pos += 4;
// 		}
// 		cout << "Got '" << m << "'\n";
// 	}
// }

#endif // HDD_HPP
