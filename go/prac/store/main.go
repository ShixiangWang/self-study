package main

import (
	"fmt"
	"store/fun"
)

func main() {
	bruce, _ := fun.CreateEmployee("Bruce", "Lee", 500)
	fmt.Println(bruce.CheckCredits())
	credits, err := bruce.AddCredits(250)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("New Credits Balance = ", credits)
	}

	_, err = bruce.RemoveCredits(2500)
	if err != nil {
		fmt.Println("Can't withdraw or overdrawn!", err)
	}

	bruce.ChangeName("Mark")

	fmt.Println(bruce)
}
