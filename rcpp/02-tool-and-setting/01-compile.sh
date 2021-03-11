#!/usr/bin/env bash
# Step1: 对 C++ 函数进行编译和链接
# 直接运行脚本或在命令行中逐步运行下面的命令

## 下面的位置可以直接在 Makeconf 中修改
## 如 D:/Tool/R-3.6.1/etc/x64/Makeconf
## 修改，位置可以通过执行 R 代码查看，如 Rscript -e 'Rcpp:::CxxFlags()'
## PKG_CXXFLAGS = d:/Tool/R_Library/Rcpp/include
## PKG_LIBS =
## R_XTRA_CPPFLAGS = -I"$(R_HOME)/include" -I"$(PKG_CXXFLAGS)" -DNDEBUG

## 指定头文件的位置
PKG_CXXFLAGS=`Rscript -e 'Rcpp:::CxxFlags()'`
## 指定库文件的位置和名称
PKG_LIBS=`Rscript -e 'Rcpp:::LdFlags()'`
R CMD SHLIB fib.cpp
## 会生成可以用于 R 的共享库，不同的系统的拓展名不同
## Unix: .so 
## Win: .dll
## OSX: .dylib