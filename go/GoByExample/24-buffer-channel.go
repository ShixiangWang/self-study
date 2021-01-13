package main

import "fmt"

func main() {
	// Create a channel
	// with buffer can store
	// 2 values
	messages := make(chan string, 2)

	messages <- "buffered"
	messages <- "channel"

	fmt.Println(<-messages)
	fmt.Println(<-messages)
}
