package main

import "fmt"

func main() {

	// Part1: a6 比 a4 大
	// a4 拷贝到 a6 还有元素保留
	a6 := []int{-10, 1, 2, 3, 4, 5}
	a4 := []int{-1, -2, -3, -4}
	fmt.Println("a6:", a6)
	fmt.Println("a4:", a4)
	copy(a6, a4)
	fmt.Println("a6:", a6)
	fmt.Println("a4:", a4)
	fmt.Println()

	// Part2: a4 比 a6 小
	// a6 拷贝到 a4 有元素拷贝不过去
	a6 = []int{-10, 1, 2, 3, 4, 5}
	a4 = []int{-1, -2, -3, -4}
	fmt.Println("a6:", a6)
	fmt.Println("a4:", a4)
	copy(a4, a6)
	fmt.Println("a6:", a6)
	fmt.Println("a4:", a4)
	fmt.Println()

	// Part3：拷贝有 4 个元素的数组到有 6 个元素的切片
	// [0:] 将数组转化为切片，不然无法使用 copy
	array4 := [4]int{4, -4, 4, -4}
	s6 := []int{1, 1, -1, -1, 5, -5}
	copy(s6, array4[0:])
	fmt.Println("array4:", array4[0:])
	fmt.Println("s6:", s6)
	fmt.Println()

	// Part4: 拷贝切片到数组
	array5 := [5]int{5, -5, 5, -5, 5}
	s7 := []int{7, 7, -7, -7, 7, -7, 7}
	copy(array5[0:], s7)
	fmt.Println("array5:", array5)
	fmt.Println("s7:", s7)
}
