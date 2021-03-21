# Go 编程学习

资料：

- [《Go by Example》](https://gobyexample-cn.github.io/)
- Go 语言圣经 [《The Go Programming Language》](https://books.studygolang.com/gopl-zh/index.html) 中文版本
- Go 实战 《Go in Action》 中文版本 - 书籍资源：https://github.com/goinaction/code
- [The way to Go](https://github.com/unknwon/the-way-to-go_ZH_CN/blob/master/eBook/directory.md)
- [Learn Go](./learngo)
- [微软：go first step](https://docs.microsoft.com/zh-cn/learn/paths/go-first-steps)

## 一些笔记

使用本地包依赖：

> <https://docs.microsoft.com/zh-cn/learn/modules/go-variables-functions-packages/4-packages>

```
module helloworld

go 1.14

require github.com/myuser/calculator v0.0.0

replace github.com/myuser/calculator => ../calculator
```