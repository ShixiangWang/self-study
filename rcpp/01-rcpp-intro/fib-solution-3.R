## 迭代解法
## 迭代解法不需要存储状态
## 也不需要递归
## 是存储方法的进一步提高
fibR <- function(n) {
    first <- 0
    second <- 1
    third <- 0
    for (i in seq_len(n)) {
        third <- first + second
        first <- second
        second <- third
    }
    return(first)
}

system.time(fibR(35))
fibR(35)

## C++ 版本
setwd("rcpp/01-rcpp-intro")
library(Rcpp)
sourceCpp("fib-solution-3.cpp")
fibonacci(35)