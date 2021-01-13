package main

import (
	"fmt"
	"sort"
)

func main() {
	ages := make(map[string]int)
	ages["alice"] = 31
	ages["charlie"] = 34
	fmt.Println(ages["alice"])

	for name, age := range ages {
		fmt.Printf("%s\t%d\n", name, age)
	}

	// Print sorted results.
	var names []string
	for name := range ages {
		names = append(names, name)
	}
	sort.Strings(names)
	for _, name := range names {
		fmt.Printf("%s\t%d\n", name, ages[name])
	}

	delete(ages, "alice") // delete an element

	_, ok := ages["alice"]
	if !ok {
		fmt.Println("Not exist.")
	}
}

// Check if two maps equal.
func equal(x, y map[string]int) bool {
	if len(x) != len(y) {
		return false
	}

	for k, xv := range x {
		if yv, ok := y[k]; !ok || yv != xv {
			return false
		}
	}
	return true
}
