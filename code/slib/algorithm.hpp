#if !defined(ALGORITHM_HPP)
#define ALGORITHM_HPP

#include "slib.hpp"


template<class T> T min(const T& a, const T& b) {
	return a < b ? a : b;
}

template<class T> T max(const T& a, const T& b) {
	return a < b ? b : a;
}

template<class T> void swap(T& a, T& b) {
	T c = b;
	b = a;
	a = c;
}

template<class T> void copy(T* start_at, T* end_at, T* dest) {
	while (start_at != end_at) {
		*dest = *start_at;
		dest++;
		start_at++;
	}
}

template<class T> void fill(T* start_at, T* end_at, const T& value) {
	while (start_at != end_at) {
		*start_at = value;
		start_at++;
	}
}

template<class T> void sort(T* start_at, T* end_at) {
	if (start_at + 1 < end_at) {
		T* center = start_at + ((end_at - start_at) >> 1);
		*(out_addr + 1) = (uint)start_at;
		*(out_addr + 1) = (uint)end_at;
		*(out_addr + 1) = (uint)center;

		swap(*center, *start_at);
		T* lower_end = start_at;
		for (T* pt = start_at + 1; pt != end_at; pt++) {
			if (*pt < *lower_end) {
				T* lower_end_next = lower_end + 1;
				if (pt != lower_end_next) {
					swap(*lower_end_next, *pt);
				}
				swap(*lower_end, *lower_end_next);
				lower_end++;
			}
		}
		sort(start_at, lower_end);
		sort(lower_end + 2, end_at);
	}
}

#endif // ALGORITHM_HPP
