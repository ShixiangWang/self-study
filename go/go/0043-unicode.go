package main

import (
	"fmt"
	"unicode"
)

func main() {
	const SL = "\x99\x00ab\x50\x00\x23\x50\x29\x9c"
	for i := 0; i < len(SL); i++ {
		if unicode.IsPrint(rune(SL[i])) {
			fmt.Printf("%c\n", SL)
		} else {
			fmt.Println("Not printable!")
		}
	}

}
