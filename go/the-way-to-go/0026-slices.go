package main

import "fmt"

func main() {
	aSlice := []int{1, 2, 3, 4, 5}
	fmt.Println(aSlice)
	integer := make([]int, 2)
	fmt.Println(integer)
	integer = nil
	fmt.Println(integer)

	// Create a reference to an existing array
	anArray := [5]int{-1, -2, -3, -4, -5}
	refAnArray := anArray[:]

	fmt.Println(anArray)
	fmt.Println(refAnArray)
	anArray[4] = -100
	fmt.Println(refAnArray)

	// Define 1D and 2D slice
	s := make([]byte, 5)
	fmt.Println(s)
	twoD := make([][]int, 3)
	fmt.Println(twoD)
	fmt.Println()

	// Init 2D slice
	for i := 0; i < len(twoD); i++ {
		for j := 0; j < 2; j++ {
			twoD[i] = append(twoD[i], i*j)
		}
	}

	// Use range to visit and print
	// all elements
	for _, x := range twoD {
		for i, y := range x {
			fmt.Println("i:", i, "value:", y)
		}
		fmt.Println()
	}

}
