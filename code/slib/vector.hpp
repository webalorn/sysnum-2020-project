#if !defined(VECTOR_HPP)
#define VECTOR_HPP

#include "slib.hpp"

template<class T>
class vector {
protected:
	uint _size, _reserved;
	T* tab;

public:
	vector(uint size = 0, T initWith = T()) : _reserved(2), _size(0) {
		// tab = new T[2];
		tab = _new<T>(2);
		this->resize(size, initWith);
		this->reserve(2);
	}
	void resize(uint newsize, T initWith = T()) {
		if (newsize > _size) {
			while (newsize > _reserved) {
				reserve(newsize);
			}
			while (_size < newsize) {
				tab[_size] = initWith;
				_size += 1;
			}
		}
		else {
			_size = newsize;
		}
	}
	void reserve(uint minreserve) {
		if (minreserve > _reserved) {
			while (_reserved < minreserve) {
				_reserved = _reserved + _reserved;
			}
			// T* newtab = new T[_reserved];
			T* newtab = _new<T>(_reserved);
			for (uint i = 0; i < _size; i++) {
				newtab[i] = tab[i];
			}
			tab = newtab;
		}
	}
	inline uint size() const {
		return _size;
	}
	inline T* begin() const {
		return tab;
	}
	inline T* end() const {
		return tab + _size;
	}
	inline T& back() {
		return *(tab + _size - 1);
	}

	inline void pop_back() {
		_size -= 1;
	}
	inline bool empty() {
		return _size == 0;
	}

	void push_back(const T& val) {
		if (_size >= _reserved) {
			reserve(_reserved + _reserved);
		}
		this->tab[_size] = val;
		_size += 1;
	}

	const T& get(uint i) const {
		return tab[i];
	}
	T& operator[] (int i) {
		return tab[i];
	}
};


#endif // VECTOR_HPP
