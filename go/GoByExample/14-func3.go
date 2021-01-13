package main

import "fmt"

// Any number of params
func sum(nums ...int) {
	fmt.Println(nums, " ")
	total := 0
	for _, num := range nums {
		total += num
	}
	fmt.Println(total)
}

func main() {
	sum(1, 2)
	sum(1, 2, 3)

	nums := []int{1, 2, 3, 4}
	// If it is a slice
	// open it with ...
	sum(nums...)

	// How about passing nothing?
	sum()
}
