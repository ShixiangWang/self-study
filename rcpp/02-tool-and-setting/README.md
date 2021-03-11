# 工具与设置

R 提供了 2 个基础的拓展函数 `.C()` 和 `.Call()`，`.C()` 由很多的限制，现在主要使用后者。

- 使用 Rcpp 进行编译[（一）](01-compile.sh)、[（二）](02-load-and-use.R)

inline 包提供了 `cfunction()`、`cxxfunction()` 和 `rcpp()` 函数用于在 R 中直接编译、链接和装载
C、C++ 或者 Fortran 函数。

构建拓展包时可以在 DESCRIPTION 文件中指定 LinkingTo:Rcpp 使用 R 自动引用 Rcpp 头文件。

