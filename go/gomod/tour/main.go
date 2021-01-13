package main

import (
	"log"

	"github.com/ShixiangWang/home/gomod/tour/cmd"
)

func main() {
	err := cmd.Execute()
	if err != nil {
		log.Fatalf("cmd.Execute err: %v", err)
	}
}
