## inline 的基本使用

## 向量的卷积
src <- '
    Rcpp::NumericVector xa(a);
    Rcpp::NumericVector xb(b);
    int n_xa = xa.size(), n_xb = xb.size();

    Rcpp::NumericVector xab(n_xa + n_xb - 1);
    for (int i=0; i<n_xa; i++)
        for (int j=0; j<n_xb; j++)
            xab[i + j] += xa[i] + xb[j];
    return xab;
'

library(inline)
## 由 signature 引入函数参数及类型
fun <- cxxfunction(signature(a='numeric', b='numeric'),
                    src, plugin='Rcpp')

fun(1:4, 2:5)
## 可以直接使用 rcpp
fun <- rcpp(signature(a='numeric', b='numeric'), src)
fun(1:4, 2:5)
## 可以使用 verbose 查看信息
fun <- rcpp(signature(a='numeric', b='numeric'), src, verbose=TRUE)
