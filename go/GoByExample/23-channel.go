package main

import "fmt"

func main() {
	messages := make(chan string)

	go func() {
		// Send a message
		messages<- "ping"
	}()

	// Accept a message
	msg := <- messages
	fmt.Println(msg)
}
