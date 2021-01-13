package main

import "fmt"

func main() {
	const s1 = 123
	const s2 float64 = 123

	var v1 float32 = s1 * 12
	var v2 float32 = s2 * 12

	fmt.Println(v1)
	fmt.Println(v2)
}
