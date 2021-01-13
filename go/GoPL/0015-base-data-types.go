package main

import (
	"fmt"
	"math"
	"unicode/utf8"
)

func main() {
	// 无符号数一般只在有位运算或其他特殊场景下使用
	var x uint8 = 1<<1 | 1<<5
	var y uint8 = 1<<1 | 1<<2

	fmt.Printf("%08b\n", x)
	fmt.Printf("%08b\n", y)

	// 8/16 进制
	oo := 0666
	fmt.Printf("%d %[1]o %#[1]o\n", oo)
	xx := int64(0xdeadbeef)
	// %之后的[1]副词告诉Printf函数再次使用第一个操作数
	fmt.Printf("%d %[1]x %#[1]x %#[1]X", xx)

	// 字符
	ascii := 'a'
	unicode := '中'
	newline := '\n'
	fmt.Printf("%d %[1]c %[1]q\n", ascii)
	fmt.Printf("%d %[1]c %[1]q\n", unicode)
	fmt.Printf("%d %[1]q\n", newline)

	// 浮点数
	var f float32 = 16777216 // 1 << 24
	fmt.Println(f == f+1)    // "true"! 有范围

	for x := 0; x < 8; x++ {
		// %e 带指数
		// %g 比较紧凑
		fmt.Printf("x = %d e^x = %8.3f\n", x, math.Exp(float64(x)))
	}

	var z float64
	fmt.Println(z, -z, 1/z, -1/z, z/z) // "0 -0 +Inf -Inf NaN"

	nan := math.NaN()
	fmt.Println(nan == nan, nan < nan, nan > nan)

	// 函数需要定义在外面
	fmt.Println(compute())

	// 字符串
	s := "hello, world"
	fmt.Println(len(s))     // "12"
	fmt.Println(s[0], s[7]) // "104 119" ('h' and 'w')

	// Unicode
	// 每个符号都分配一个唯一的Unicode码点，Unicode码点对应Go语言中的rune整数类型（译注：rune是int32等价类型）。
	//unicode/utf8包则提供了用于rune字符序列的UTF8编码和解码的功能。
	// 得益于UTF8编码优良的设计，诸多字符串操作都不需要解码操作。

	s = "Hello, 世界"
	fmt.Println(len(s))                    // "13"
	fmt.Println(utf8.RuneCountInString(s)) // "9"

	for i := 0; i < len(s); {
		r, size := utf8.DecodeRuneInString(s[i:])
		fmt.Printf("%d\t%c\n", i, r)
		i += size // 这一步很重要
	}

	// 幸运的是，Go语言的range循环在处理字符串的时候，会自动隐式解码UTF8字符串。
	// 需要注意的是对于非ASCII，索引更新的步长将超过1个字节。
	for i, r := range "Hello, 世界" {
		fmt.Printf("%d\t%q\t%d\n", i, r, r)
	}

}

func compute() (xx float64, ok bool) {
	var value = 20
	var failed = false
	var result = 0.0
	if value > 1 {
		failed = true
	} else {
		result = 1.0
	}
	if failed {
		return 0.0, false
	}
	return result, true
}
