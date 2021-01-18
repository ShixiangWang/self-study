package main

import "fmt"

func vals() (int, int) {
	return 3, 7
}

func main() {
	a, b := vals()
	fmt.Println(a)
	fmt.Println(b)

	_, c := vals()
	fmt.Println(c)

	// range 可以只接收 1 个参数
	// 函数不行？
	d, _ := vals()
	fmt.Println(d)
}
