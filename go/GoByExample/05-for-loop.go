package main

import "fmt"

func main() {
	i := 1
	for i <= 3 {
		fmt.Println(i)
		i++
	}

	// Standard way
	for j := 7; j <= 9; j++ {
		fmt.Println("loop")
	}

	// Dead loop
	// break out using 'break' or 'return'
	for {
		fmt.Println("loop")
		break
	}
}
