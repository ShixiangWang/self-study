package main

import "fmt"

func main() {
	a := [2][3]int{{1, 2, 3}, {4, 5, 6}}
	for i := 0; i < len(a); i++ {
		v := a[i]
		for j := 0; j < len(v); j++ {
			fmt.Println(v[j])
		}
	}

	for _, v := range a {
		for _, m := range v {
			fmt.Println(m)
		}
	}
}
