#include <iostream>
using namespace std;

int main() {
    int hour, minute;
    hour = 11;
    minute = 59;
    // 数值操作符：
    // 操作包括一些基本的数学运算
    // 1 + 1
    // 1 - 1
    // 1 * 1
    // 1 / 1
    cout << "Number of minutes since midnight: ";
    cout << hour * 60 + minute << endl;
    cout << "Fraction of the hour that has passed: ";
    cout << minute/60 << endl; // 由于进行的是整除，这里的结果是错误的
    cout << "Percentage of the hour that has passed: ";
    cout << minute*100/60 << endl; // 这是一种备选的方式，另外可以使用浮点除，这里暂未讲述 TODO

    // 字符操作符
    char letter;
    letter = 'a' + 1;
    cout << "'a' + 1 is '" << letter << "'" << endl;
    return 0;
}