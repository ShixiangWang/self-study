package main

import (
	"fmt"
	"moduledemo/mypackage" // 导入同一项目下的mypackage包
)

func main() {
	mypackage.New()
	fmt.Println("main")
}
