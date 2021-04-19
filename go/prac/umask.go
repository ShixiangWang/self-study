package main

import (
	"fmt"
	"os"
	"syscall"
)

func main() {
	// 需要 Umask
	// 理解：https://langzi989.github.io/2017/09/13/Linux%E4%B8%ADumash%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3/
	mask := syscall.Umask(0)
	defer syscall.Umask(mask)

	err := os.MkdirAll("/tmp/gotest/", 0777)
	if err != nil {
		panic(err)
	}

	fmt.Println("Mkdir /tmp/gotest/")
}
