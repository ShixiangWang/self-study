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

`switch` 使用正则：

```go
package main

import "fmt"

import "regexp"

func main() {
    var email = regexp.MustCompile(`^[^@]+@[^@.]+\.[^@.]+`)
    var phone = regexp.MustCompile(`^[(]?[0-9][0-9][0-9][). \-]*[0-9][0-9][0-9][.\-]?[0-9][0-9][0-9][0-9]`)

    contact := "foo@bar.com"

    switch {
    case email.MatchString(contact):
        fmt.Println(contact, "is an email")
    case phone.MatchString(contact):
        fmt.Println(contact, "is a phone number")
    default:
        fmt.Println(contact, "is not recognized")
    }
}
```

`switch` 替换多重 if-else：

```go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().Unix())
    r := rand.Float64()
    switch {
    case r > 0.1:
        fmt.Println("Common case, 90% of the time")
    default:
        fmt.Println("10% of the time")
    }
}
```

序列化：

```go
package main

import (
	"encoding/json"
	"fmt"
)

type Person struct {
	ID        int
	FirstName string `json:"name"`
	LastName  string
	Address   string `json:"address,omitempty"`
}

type Employee struct {
	Person
	ManagerID int
}

type Contractor struct {
	Person
	CompanyID int
}

func main() {
	employees := []Employee{
		Employee{
			Person: Person{
				LastName: "Doe", FirstName: "John",
			},
		},
		Employee{
			Person: Person{
				LastName: "Campbell", FirstName: "David",
			},
		},
	}

	data, _ := json.Marshal(employees)
	fmt.Printf("%s\n", data)

	var decoded []Employee
	json.Unmarshal(data, &decoded)
	fmt.Printf("%v", decoded)
}
```