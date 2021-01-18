package main

import "fmt"

func zeroval(ival int) {
	ival = 0
}

func zeroptr(iptr *int) {
	// set the value pointed by iptr
	*iptr = 0
}

func main() {
	i := 1
	fmt.Println("initial:", i)

	// 传值
	zeroval(i)
	fmt.Println("zeroval:", i)

	// 穿引用，即地址
	zeroptr(&i)
	fmt.Println("zeroptr:", i)

	// &i get the address of i
	fmt.Println("pointer:", &i)
}
