package main

import (
	"fmt"
	"net/http"
	"time"
)

func checkAPI(api string, ch chan string) {
	_, err := http.Get(api)
	if err != nil {
		ch <- fmt.Sprintf("ERROR: %s is down!\n", api)
		return
	}

	ch <- fmt.Sprintf("SUCCESS: %s is up and running!\n", api)
}

func main() {
	start := time.Now()
	ch := make(chan string)

	apis := []string{
		"https://play.studygolang.com/",
		"https://www.jianshu.com/",
		"https://www.yuque.com/",
		"https://www.baidu.com/",
	}

	for _, api := range apis {
		go checkAPI(api, ch)
	}

	for i := 0; i < len(apis); i++ {
		fmt.Print(<-ch)
	}
	//fmt.Print(<-ch) // print 一旦完成就会进入下一行
	elapsed := time.Since(start)
	fmt.Printf("Done! It took %v seconds!\n", elapsed.Seconds())
}
