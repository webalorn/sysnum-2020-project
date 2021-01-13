#if !defined(STRING_HPP)
#define STRING_HPP

#include "vector.hpp"
#include "iostream.hpp"

// string : unicode characters on 32 bits
class string : public vector<char32_t> {
public:
	string(int size = 0, uint defaultChar = 0) : vector<char32_t>(size, defaultChar) {}
	template<class T>
	string(const T* s) : vector<char32_t>(0, 0) {
		while (*s) {
			char32_t c = *s;
			push_back(c);
			s++;
		}
	}
	template<class T>
	void operator = (const T* s) {
		T* pt = s;
		uint size = 0;
		while (*pt) {
			pt++;
			size++;
		}
		resize(size);
		while (*s) {
			uint c = *s;
			push_back(c);
			s++;
		}
	}

	vector<string> split(uint splitChar) {
		vector<string> parts(1, "");
		char32_t* end_pt = tab + _size;
		for (char32_t* pt = tab; pt != end_pt; pt++) {
			if (*pt == splitChar) {
				if (parts.back().size()) {
					parts.push_back("");
				}
			}
			else {
				parts.back().push_back(*pt);
			}
		}
		return parts;
	}
};

TextOutStream& operator<<(TextOutStream& os, const string& s) {
	for (uint c : s) {
		os.send_word(c);
	}
	return os;
}

string operator + (const string& s1, const string& s2) {
	uint l1 = s1.size(), l2 = s2.size();
	string s_final(l1 + l2);
	for (int i = 0; i < l1; i++) {
		s_final[i] = s1.get(i);
	}
	for (int i = 0; i < l2; i++) {
		s_final[l1 + i] = s2.get(i);
	}
	return s_final;
}

string to_string(uint num) {
	string s;
	s.reserve(11);
	bool before = false;
	for (uint i = 10; i < 10; i++) {
		int cur = 0;
		while (num >= digits32[i]) {
			cur += 1;
			num -= digits32[i];
		}
		if (cur || before) {
			before = true;
			s.push_back('0' + cur);
		}
	}
	return s;
}

#endif // STRING_HPP
