#include <algorithm>
#include <vector>
#include <stdexcept>
#include <cmath>
#include <iostream>
#include <Rcpp.h>
using namespace Rcpp;

// 通过 3 部分定义 C++ 类 Fib：
// 1. 初始化时调用的构造函数
// 2. 计算 Fn 的单一成员函数
// 3. 用于存储结构的私有向量
class Fib {
    public:
        Fib(unsigned int n = 1000) {
            memo.resize(n); // 预留 n 个元素
            std::fill(memo.begin(), memo.end(), NAN);
            memo[0] = 0.0;
            memo[1] = 1.0; // 对 n=0 和 n=1 情况进行初始化
        }
        double fibonacci(int x) {
            if (x < 0) return((double) NAN);
            if (x >= (int) memo.size())
                throw std::range_error("\"x too large for implementation\"");
            if (! std::isnan(memo[x])) return(memo[x]);
            memo[x] = fibonacci(x -2) + fibonacci(x - 1);
            return(memo[x]);
        }
    private:
        std::vector<double> memo;
};

// [[Rcpp::export]]
int fibonacci(const int x) {
    Fib f;
    return f.fibonacci(x);
}