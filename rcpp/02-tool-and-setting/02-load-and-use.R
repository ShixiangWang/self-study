setwd("rcpp/02-tool-and-setting")
# 载入共享库
dyn.load("fib.dll")
# 调用
.Call('fibWrapper', 35)