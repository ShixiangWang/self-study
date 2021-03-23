package main

import (
	"fmt"
)

func main() {
	val := 0
	for {
		// 不考虑输入非整数的可能
		fmt.Print("Enter integer: ")
		fmt.Scanf("%d", &val)
		// if val > 0 {
		// 	fmt.Println("You entered: ", val)
		// } else if val == 0 {
		// 	fmt.Println("0 is neither negative nor positive")
		// } else {
		// 	panic("You entered a negative number.")
		// }

		switch {
		case val < 0:
			panic("You entered a negative number!")
		case val == 0:
			fmt.Println("0 is neither negative nor positive")
		default:
			fmt.Println("You entered:", val)
		}
	}
}
