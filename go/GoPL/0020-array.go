package main

import "fmt"

func main() {
	// Array of 3 integers
	var a [3]int
	fmt.Println(a[0])
	fmt.Println(a[len(a)-1])

	// Print the indices and elements.
	for i, v := range a {
		fmt.Printf("%d %d\n", i, v)
	}

	// Print the elements only.
	for _, v := range a {
		fmt.Printf("%d\n", v)
	}

	// Init value.
	var q [3]int = [3]int{1, 2, 3}
	var r [3]int = [3]int{1, 2}
	fmt.Println(q)
	fmt.Println(r[2])

	// ... let go to auto get the length.
	q = [...]int{1, 2, 3}
	fmt.Printf("%T\n", q)

	type Currency int

	const (
		USD Currency = iota
		EUR
		GBP
		RMB
	)

	// Similar to Map.
	symbol := [...]string{USD: "$", EUR: "E", GBP: "F", RMB: "￥"}

	fmt.Println(RMB, symbol[RMB])
}
