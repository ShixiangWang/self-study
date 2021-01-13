package main

// == cannot be used to compare two slices.
func equal(x, y []string) bool {
	if len(x) != len(y) {
		return false
	}

	for i := range x {
		if x[i] != y[i] {
			return false
		}
	}
	return true
}

func main() {
	// make([]T, len)
	// make([]T, len, cap) // same as make([]T, cap)[:len]

	var s []int    // len(s) == 0, s == nil
	s = nil        // same as above
	s = []int(nil) // same as above
	s = []int{}    // len(s) == 0, s != nil
}
