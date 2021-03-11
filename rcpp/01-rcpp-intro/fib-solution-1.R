fibR <- function(n) {
    if (n == 0) return(0)
    if (n == 1) return(1)
    return(fibR(n - 1) + fibR(n - 2))
}



## R 版本
## 致命的缺点：效率低
system.time(fibR(35))
# 10s

## C++ 版本
setwd("rcpp/01-rcpp-intro")
library(Rcpp)
## 编译 Rcpp 文件并载入 R
sourceCpp("fib-solution-1.cpp")
system.time(fibonacci(35))
# 0.046s