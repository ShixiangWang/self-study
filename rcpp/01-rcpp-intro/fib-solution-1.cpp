#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int fibonacci(const int x) {
    if (x < 2)
        return x;
    else
        return (fibonacci(x - 1)) + fibonacci(x - 2);
}


// The following is a R code block
// which will be executed after compiling
/*** R
fibonacci(35)
*/