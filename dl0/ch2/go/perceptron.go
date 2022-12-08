package main

import (
	"fmt"

	"gonum.org/v1/gonum/mat"
)

// http://qiuwenqi.com/2020-08-31-python-numpy.html

func AND(x1 float64, x2 float64) int8 {
	x := mat.NewVecDense(2, []float64{x1, x2})
	w := mat.NewVecDense(2, []float64{0.5, 0.5})
	b := -0.7
	tmp := mat.Dot(x, w) + b
	if tmp <= 0 {
		return 0
	} else {
		return 1
	}
}

func NAND(x1 float64, x2 float64) int8 {
	x := mat.NewVecDense(2, []float64{x1, x2})
	w := mat.NewVecDense(2, []float64{-0.5, -0.5})
	b := 0.7
	tmp := mat.Dot(x, w) + b
	if tmp <= 0 {
		return 0
	} else {
		return 1
	}
}

func OR(x1 float64, x2 float64) int8 {
	x := mat.NewVecDense(2, []float64{x1, x2})
	w := mat.NewVecDense(2, []float64{0.5, 0.5})
	b := -0.2
	tmp := mat.Dot(x, w) + b
	if tmp <= 0 {
		return 0
	} else {
		return 1
	}
}

func XOR(x1 float64, x2 float64) int8 {
	s1 := NAND(x1, x2)
	s2 := OR(x1, x2)
	y := AND(float64(s1), float64(s2))
	return y
}

func main() {
	fmt.Println(XOR(0, 0)) // 0
	fmt.Println(XOR(1, 0)) // 1
	fmt.Println(XOR(0, 1)) // 1
	fmt.Println(XOR(1, 1)) // 0
}
