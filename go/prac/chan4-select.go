package main

import (
	"fmt"
	"time"
)

func process(ch chan string) {
	time.Sleep(3 * time.Second)
	ch <- "Done processing!"
}

func replicate(ch chan string) {
	time.Sleep(1 * time.Second)
	ch <- "Done replicating!"
}

func main() {
	ch1 := make(chan string)
	ch2 := make(chan string)
	go process(ch1)
	go replicate(ch2)

	for i := 0; i < 2; i++ {
		// select 类似 switch，但用于 chan
		select {
		case process := <-ch1:
			fmt.Println(process)
		case replicate := <-ch2:
			fmt.Println(replicate)
		}
	}
}
