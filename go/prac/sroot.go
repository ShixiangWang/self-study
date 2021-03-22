package main

import "fmt"

func main() {
	x := 25.0
	sroot := 1.0
	for i := 0; i < 10; i++ {
		sroot = sroot - (sroot*sroot-x)/(2*sroot)
		fmt.Println("A guess for square root is ", sroot)
	}
	fmt.Println("Square root is: ", sroot)
}
