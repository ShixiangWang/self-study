#include<iostream>
using namespace std;

// 变量是命名的内存地址，用于存储数据
int main() {
    //// 进行变量声明，由程序设定默认值
    // int hour, minute;
    // char colon;

    // 进行变量声明，并初始化默认值
    // int 整型
    // char 字符型
    int hour = 11;
    int minute = 59;
    char colon = ':';

    cout << "The current time is " << hour << colon << minute << endl;
    return 0;
}

