package main

import (
	"fmt"
)

func main() {
	nums := []int{2, 3, 4}
	sum := 0
	// calculate Sum
	for _, num := range nums {
		sum += num
	}
	fmt.Println("sum:", sum)

	// Index, Value
	for i, num := range nums {
		if num == 3 {
			fmt.Println("index:", i)
		}
	}

	// How about just index?
	for i := range nums {
		fmt.Println("index:", i)
	}

	// Range Map
	kvs := map[string]string{"a": "apple", "b": "banana"}
	for k, v := range kvs {
		fmt.Printf("%s -> %s \n", k, v)
	}

	// Range key only
	for k := range kvs {
		fmt.Println("key:", k)
	}

	// Range character
	// Index, char
	for i, c := range "gogo" {
		fmt.Println(i, c)
	}
}
