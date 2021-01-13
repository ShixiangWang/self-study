package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	// Default 调用生成两个默认中间件
	// New() -> Logger() 输出日志生成
	// New() -> Recovery() 错误处理与日志生成
	r := gin.Default()
	// Route
	r.GET("/ping", func(c *gin.Context) {
		// Resonse to a query
		c.JSON(200, gin.H{"message": "pong"})
	})
	r.Run()
}
