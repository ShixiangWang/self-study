package main

import (
	"bytes"
	"fmt"
)

func intsToString(value []int) string {
	var buf bytes.Buffer
	buf.WriteByte('[')
	for i, v := range value {
		if i > 0 {
			buf.WriteString(", ")
		}
		fmt.Fprintf(&buf, "%d", v)
	}
	buf.WriteByte(']')
	return buf.String()
}

func main() {
	fmt.Println(intsToString([]int{1, 2, 3}))

	// const
	const (
		a = 1
		b
		c = 2
		d
	)

	fmt.Println(a, b, c, d)

	type Weekday int

	const (
		Sunday Weekday = iota
		Monday
		Tuesday
		Wednesday
		Thursday
		Friday
		Saturday
	)

	const (
		_   = 1 << (10 * iota)
		KiB // 1024
		MiB // 1048576
		GiB // 1073741824
		TiB // 1099511627776             (exceeds 1 << 32)
		PiB // 1125899906842624
		EiB // 1152921504606846976
		ZiB // 1180591620717411303424    (exceeds 1 << 64)
		YiB // 1208925819614629174706176
	)

}
