# Javascript 学习笔记

> 主要学习资料：[《网道：javascript 教程》](https://wangdoc.com/javascript/)

## 第一步

打开谷歌浏览器，按下 `Option + Command + J`（Mac）或者 `Ctrl + Shift + J`（Windows / Linux）进入控制台。

`Enter` 运行代码；`Shift + Enter` 换行。

## js 基本语法

```js
var a = 1;
var b;
b = "abc";

// 合法标志符
arg0
_tmp
$elem

// 注释
// 行注释
/*
块注释
*/

// 代码块
{

}

//  if
if (a == 1) {
  console.log("a == 1");
} else {
  console.log("a != 1");
}

// switch
switch (a) {
  case 1:
    // ...
    break;
  case 2:
    // ...
    break;
  default:
    // ...
}

// 三元运算符
var even = (n % 2 === 0) ? true : false;

// 循环
while (a > 0) {
  // ...
}

var x = 3;
for (var i = 0; i < x; i++) {
  console.log(i)
}

do
  // ...
while (true);

// break and continue

// label
foo: {
  console.log(1);
  break foo;
  console.log(2);
}
console.log(3)
```

## 数据类型

### 简介

- 数值 number
- 字符串 string
- 布尔值 boolean
- 未定义 undefined
- 空值 null
- 对象 object（值的集合）

前三者合称为原始类型，不能再细分。对象成为合成类型，是基于原始类型构建的。未定义与空值一般看作两个特殊值。

对象一般可以分为 3 个子类型：

- 狭义的对象
- 数组
- 函数

JS 有 3 种方法确定值的类型：

- `typeof` - 运算符
- `instanceof` - 运算符
- `Object.prototype.toString` - 方法

```js
> typeof 123
'number'
> typeof "123"
'string'
> typeof false
'boolean'
> typeof function f() {}
'function'
> typeof undefined
'undefined'
> typeof v
'undefined'
> typeof null // 历史原因造成的
'object'
> typeof {}
'object'
> typeof []
'object'

> var o = {}
undefined
> var a = []
undefined
> o instanceof Array
false
> a instanceof Array
true
```


null, undefined 和布尔值 详解：<https://wangdoc.com/javascript/types/null-undefined-boolean.html>.

### 数值

转换和测试方法。

```js
parseInt()
parseFloat()
isNaN()
isFinite()
```

### 字符串

单双引号等同。

> 由于 HTML 语言的属性值使用双引号，所以很多项目约定 JavaScript 语言的字符串只使用单引号，本教程遵守这个约定。当然，只使用双引号也完全可以。重要的是坚持使用一种风格，不要一会使用单引号表示字符串，一会又使用双引号表示。

连接运算符（+）可以连接多个单行字符串。

字符串可以被视为字符数组，因此可以使用数组的方括号运算符，用来返回某个位置的字符（位置编号从0开始）。

如果方括号中的数字超过字符串的长度，或者方括号中根本不是数字，则返回 undefined。

```js
> var s = 'hello';
undefined
> s[0]
'h'
> s[1]
'e'
> 
> s[-1]
undefined
> s.length
5
> '𝌆'.length
2
```

上面代码中，JavaScript 认为𝌆的长度为 2，而不是 1。

Base64 就是一种编码方法，可以将任意值转成 0～9、A～Z、a-z、+和/这64个字符组成的可打印字符。使用它的主要目的，不是为了加密，而是为了不出现特殊字符，简化程序的处理。

JavaScript 原生提供两个 Base64 相关的方法。

- `btoa()`：任意值转为 Base64 编码
- `atob()`：Base64 编码转为原来的值

```js
// 无法在 node 中直接使用
var string = 'Hello World!';
btoa(string) // "SGVsbG8gV29ybGQh"
atob('SGVsbG8gV29ybGQh') // "Hello World!"
```

### 对象

js 中对象就是一组“键值对”（key-value）的集合，是一种无序的复合数据集合。

在其他编程语言中，这种对象概念常被称为字典。

对象的所有键名都是字符串（ES6 又引入了 Symbol 值也可以作为键名），所以加不加引号都可以。

```js
> var obj1 = {a:1, b:2}
undefined
> obj1
{ a: 1, b: 2 }
> var obj2 = {'a':1, 'b':2}
undefined
> obj2
{ a: 1, b: 2 }
```

**对象的每一个键名又称为“属性”（property），它的“键值”可以是任何数据类型。如果一个属性的值为函数，通常把这个属性称为“方法”，它可以像函数那样调用。**

```js
> var obj = {
... printHello: function(x) {
..... console.log("Hello" + x)
..... }
... }
undefined
> obj.printHello('world')
Helloworld
```

如果不同的变量名指向同一个对象，那么它们都是这个对象的引用，也就是说指向同一个内存地址。修改其中一个变量，会影响到其他所有变量。

但是，这种引用只局限于对象，如果两个变量指向同一个原始类型的值。那么，变量这时都是值的拷贝。

读取对象的属性，有两种方法，一种是使用点运算符，还有一种是使用方括号运算符。

```js
> obj1.a
1
> obj1['a']
1
```

查看属性：

```js
> Object.keys(obj1)
[ 'a', 'b' ]
```

删除：

```js
> delete obj1.a
true
> obj1
{ b: 2 }
```

注意，删除一个不存在的属性，delete 不报错，而且返回 true。

用 `in` 运算符判断属性存在：

```js
> 'a' in obj1
false
> 'b' in obj1
true
```

`in` 运算符的一个问题是，它不能识别哪些属性是对象自身的，哪些属性是继承的。
这时候可以使用 `hasOwnProperty` 方法。

```js
> 'toString' in obj1
true
> obj1.hasOwnProperty('toString')
false
```

`for...in` 循环用来遍历一个对象的全部属性。

```js
> var obj = {a: 1, b:2, c:3};
undefined
> for (var i in obj) {
... console.log('key: ', i);
... console.log('value: ', obj[i]);
... }
key:  a
value:  1
key:  b
value:  2
key:  c
value:  3
```

它遍历的是对象所有可遍历（enumerable）的属性（包括继承的），会跳过不可遍历的属性。

`with` 语句提供了修改对象的方便操作，类似于 R 中的 `with`。

```js
var obj = {
  p1: 1,
  p2: 2,
};
with (obj) {
  p1 = 4;
  p2 = 5;
}
// 等同于
obj.p1 = 4;
obj.p2 = 5;
```

### 函数

函数是一段可以反复调用的代码块，有以下 3 种声明方式。

- function 命令。

```js
function print(s) {
  consolo.log(s);
}
```

- 函数表达式（注意结尾处的分号）

```js
var print = function(s) {
  console.log(a);
};
```

- Function 构造函数（最后一个参数被作为函数体）

```js
var print = new Function(
  's',
  'console.log(s)'
);
```

JavaScript 语言将函数看作一种值，与其它值（数值、字符串、布尔值等等）地位相同。凡是可以使用值的地方，就能使用函数。

函数有以下一些属性：

- `name` - 函数名
- `length` - 函数预期传入参数的个数
- `toString()` 方法返回字符串源码（包括注释）

作用域（scope）指的是变量存在的范围。目前新版 js 有 3 种：

- 全局作用域
- 函数作用域
- 块级作用域（ES 6 新增）

注意 js 中的**变量提升**，声明语句在实际运行时会被提升到作用域的顶部。

函数参数不是必需的，JavaScript 允许省略参数。

省略的参数的值就变为 `undefined`。需要注意的是，函数的 `length` 属性与实际传入的参数个数无关，只反映函数预期传入的参数个数。但是，没有办法只省略靠前的参数，而保留靠后的参数。如果一定要省略靠前的参数，只有显式传入 `undefined`。

```js
> function echo(a, b) {
... return a;
... }
undefined
> echo(1, 2, 3)
1
> echo(1)
1
> echo()
undefined
> echo(undefined, 1)
undefined
```

如果有同名的参数，则取最后出现的那个值。

函数传参方式：

- 函数参数如果是原始类型的值（数值、字符串、布尔值），传递方式是传值传递（passes by value）。
- 如果函数参数是复合类型的值（数组、对象、其他函数），传递方式是传址传递（pass by reference）。

`arguments` 对象：由于 JavaScript 允许函数有不定数目的参数，所以需要一种机制，可以在函数体内部读取所有参数。这就是 `arguments` 对象的由来。

`arguments` 对象包含了函数运行时的所有参数，`arguments[0]` 就是第一个参数，`arguments[1]` 就是第二个参数，以此类推。这个对象只有在函数体内部，才可以使用。

```js
var f = function (one) {
  console.log(arguments[0]);
  console.log(arguments[1]);
  console.log(arguments[2]);
}

f(1, 2, 3)
// 1
// 2
// 3
```

正常模式下，`arguments 对象可以在运行时修改。

```js
var f = function(a, b) {
  arguments[0] = 3;
  arguments[1] = 2;
  return a + b;
}

f(1, 1) // 5
```

严格模式下，`arguments` 对象与函数参数不具有联动关系。也就是说，修改 `arguments` 对象不会影响到实际的函数参数。

```js
var f = function(a, b) {
  'use strict'; // 开启严格模式
  arguments[0] = 3;
  arguments[1] = 2;
  return a + b;
}

f(1, 1) // 2
```

通过 `arguments` 对象 `length` 属性，可以判断函数调用时到底带几个参数。

需要注意的是，虽然 `arguments` 很像数组，但它是一个对象。

如果要让 `arguments` 对象使用数组方法，真正的解决方法是将 `arguments` 转为真正的数组。下面是两种常用的转换方法：`slice` 方法和逐一填入新数组。

```js
var args = Array.prototype.slice.call(arguments);

// 或者
var args = [];
for (var i = 0; i < arguments.length; i++) {
  args.push(arguments[i]);
}
```

`arguments` 对象带有一个 `callee` 属性，返回它所对应的原函数。

```js
var f = function () {
  console.log(arguments.callee === f);
}

f() // true
```

### 函数闭包

正常情况下，函数外部无法读取函数内部声明的变量。

```js
function f1() {
  var n = 999;
}

console.log(n)
// Uncaught ReferenceError: n is not defined(
```

如果出于种种原因，需要得到函数内的局部变量。正常情况下，这是办不到的，只有通过变通方法才能实现。那就是在函数的内部，再定义一个函数。

```js
function f1() {
  var n = 999;
  function f2() {
　　console.log(n); // 999
  }
}
```

**上面代码中，函数 `f2` 就在函数 `f1` 内部，这时 `f1` 内部的所有局部变量，对 `f2` 都是可见的。但是反过来就不行，`f2` 内部的局部变量，对 `f1` 就是不可见的。**

那么只要把 `f2` 作为返回值，我们不就可以在 `f1` 外部读取它的内部变量了吗！

```js
function f1() {
  var n = 999;
  function f2() {
    console.log(n);
  }
  return f2;
}

var result = f1();
result(); // 999
```

**闭包就是函数 `f2`，即能够读取其他函数内部变量的函数。由于在 JavaScript 语言中，只有函数内部的子函数才能读取内部变量，因此可以把闭包简单理解成“定义在一个函数内部的函数”。闭包最大的特点，就是它可以“记住”诞生的环境，比如 `f2` 记住了它诞生的环境 `f1`，所以从 `f2` 可以得到 `f1` 的内部变量。在本质上，闭包就是将函数内部和函数外部连接起来的一座桥梁。**

**闭包的最大用处有两个**

- 一个是可以读取外层函数内部的变量，另一个就是让这些变量始终保持在内存中，即闭包可以使得它诞生环境一直存在。
- 闭包的另一个用处，是封装对象的私有属性和私有方法。

```js
function createIncrementor(start) {
  return function () {
    return start++;
  };
}

var inc = createIncrementor(5);

inc() // 5
inc() // 6
inc() // 7
```

```js
function Person(name) {
  var _age;
  function setAge(n) {
    _age = n;
  }
  function getAge() {
    return _age;
  }

  return {
    name: name,
    getAge: getAge,
    setAge: setAge
  };
}

var p1 = Person('张三');
p1.setAge(25);
p1.getAge() // 25
```

注意，外层函数每次运行，都会生成一个新的闭包，而这个闭包又会保留外层函数的内部变量，所以内存消耗很大。因此不能滥用闭包，否则会造成网页的性能问题。

### eval 命令

eval命令接受一个字符串作为参数，并将这个字符串当作语句执行。

```js
eval('var a = 1;');
a // 1
```

`eval` 没有自己的作用域，都在当前作用域内执行，因此可能会修改当前作用域的变量的值，造成安全问题。

为了防止这种风险，JavaScript 规定，如果使用严格模式，`eval` 内部声明的变量，不会影响到外部作用域。

### 数组

数组（array）是按次序排列的一组值。



## electron 使用

### 创建项目文件夹并安装 electron

```
mkdir my-electron-app && cd my-electron-app
npm init -y
npm i --save-dev electron
```

- <https://www.limitcode.com/detail/59a15b1a69e95702e0780249.html>
- <https://learnku.com/articles/15975/npm-accelerate-and-modify-mirror-source-in-china>

配置淘宝镜像：

```
npm config set registry https://registry.npm.taobao.org
npm config set disturl https://npm.taobao.org/dist
npm config set electron_mirror https://npm.taobao.org/mirrors/electron/
```

### 应用打包和分发

```
# 应用 Electron forge
npx @electron-forge/cli import
# 创建分发版本，结果在 out 目录下
npm run make
```
