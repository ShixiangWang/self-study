## From Pt Burns
fibR <- local(
    {
        memo <- c(1, 1, rep(NA, 1000))
        f <- function(x) {
            if (x == 0) return(0)
            if (x < 0) return(NA)
            if (x > length(memo)) {
                stop("x too big for implementation")
            }
            if (!is.na(memo[x])) return(memo[x])
            ans <- f(x-2) + f(x-1)
            memo[x] <<- ans
            ans
        }
    }
)

## Amazing 的设计：
## 如果 n 对应的值算过了，那么直接返回
## 否则，计算并存储再向量 memo 中
## 保证同样的计算只进行一次，达到加速的目的
## 
## 这里使用了 local，创建匿名递归函数时非常有用
system.time(fibR(35))
fibR(35)

## C++ 版本
setwd("rcpp/01-rcpp-intro")
library(Rcpp)
sourceCpp("fib-solution-2.cpp")
fibonacci(35)