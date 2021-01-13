package main

import "fmt"

// This function use
// closure to hide the variable i
func intSeq() func() int {
	i := 0
	return func() int {
		i++
		return i
	}
}

func main() {
	// Return a function
	// including variable i
	// the i will be updated
	// after called every time
	nextInt := intSeq()

	fmt.Println(nextInt())
	fmt.Println(nextInt())

	// New closure
	nextInts := intSeq()

	fmt.Println(nextInts())
	fmt.Println(nextInts())
}
