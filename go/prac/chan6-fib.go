package main

import (
	"fmt"
	"time"
)

var quit = make(chan bool)

func fib(c chan int) {
	x, y := 1, 1

	for {
		select {
		case c <- x:
			x, y = y, x+y
		case <-quit:
			fmt.Println("Done calculating Fibonacci!")
			return
		}
	}
}

func main() {
	start := time.Now()

	command := ""
	data := make(chan int)

	go fib(data)

	for {
		num := <-data
		fmt.Println(num)
		fmt.Scanf("%s", &command)
		if command == "quit" {
			quit <- true
			break
		}
	}

	time.Sleep(1 * time.Second)

	elapsed := time.Since(start)
	fmt.Printf("Done! It took %v seconds!\n", elapsed.Seconds())
}
