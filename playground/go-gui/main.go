package main

import (
    "fmt"

    "github.com/go-gl/glfw/v3.3/glfw"
)

func main() {
    // 初始化 glfw 包
    if err := glfw.Init(); err != nil {
        panic(err)
    }
    defer glfw.Terminate()

    // 创建一个窗口
    window, err := glfw.CreateWindow(640, 480, "Hello, GLFW", nil, nil)
    if err != nil {
        panic(err)
    }

    // 在窗口中绘制一个简单的图形
    window.MakeContextCurrent()
    fmt.Println("Hello, GLFW!")
}
