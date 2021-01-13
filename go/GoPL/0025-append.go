package main

import "fmt"

func appendInt(x []int, y int) []int {
	var z []int
	zlen := len(x) + 1
	if zlen <= cap(x) {
		// There is room to grow.
		// Extend the slice
		z = x[:zlen]
	} else {
		// This is insufficient space.
		// Allocate a new array.
		// Grow by doubling, for amortized linear complexity.
		zcap := zlen
		if zcap < 2*len(x) {
			zcap = 2 * len(x)
		}
		z = make([]int, zlen, zcap)
		copy(z, x)
	}
	z[len(x)] = y
	return z
}

// ... 提示接收变长的参数为 slice
func appendInt2(x []int, y ...int) []int {
	var z []int
	zlen := len(x) + len(y)
	copy(z[len(x):], y)
	return z
}

func main() {
	var x, y []int
	for i := 0; i < 10; i++ {
		y = appendInt(x, i)
		fmt.Printf("%d cap=%d\t%v\n", i, cap(y), y)
		x = y
	}
}

// slice 并不是一个纯粹的引用类型
type IntSlice struct {
	ptr      *int
	len, cap int
}
