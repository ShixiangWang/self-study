package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("PID: ", os.Getpid())
	fmt.Println("PPID", os.Getppid())
}
