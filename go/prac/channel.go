package main

import (
	"fmt"
)

func main() {
	data := make(chan int, 3)
	exit := make(chan bool)

	go func() {
		for d := range data {
			fmt.Println(d)
		}

		fmt.Println("recv over.")
		exit <- true
	}()

	data <- 1
	data <- 2
	data <- 3
	close(data)

	//time.Sleep(5 * time.Microsecond)
	fmt.Println("send over.")
	<-exit
}
