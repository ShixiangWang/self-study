#include <Rcpp.h>

int fibonacci(const int x) {
    if (x < 2)
        return x;
    else
        return (fibonacci(x - 1)) + fibonacci(x - 2);
}

extern "C" SEXP fibWrapper(SEXP xs) {
    int x = Rcpp::as<int>(xs); // as 将输入参数由 SEXP 类型转换为整型
    int fib = fibonacci(x);
    return (Rcpp::wrap(fib)); // wrap 将整型转换回 SEXP 类型
}