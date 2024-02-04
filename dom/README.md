# HTML DOM

根据 W3C 的 HTML DOM 标准，HTML 文档中的所有内容都是节点：

- 整个文档是一个文档节点
- 每个 HTML 元素是元素节点
- HTML 元素内的文本是文本节点
- 每个 HTML 属性是属性节点
- 注释是注释节点

![](https://www.runoob.com/wp-content/uploads/2013/09/ct_htmltree.gif)

HTML DOM 方法是我们可以在节点（HTML 元素）上执行的动作。

HTML DOM 属性是我们可以在节点（HTML 元素）设置和修改的值。

- https://www.runoob.com/htmldom/htmldom-methods.html

一些常用的 HTML DOM 方法：

- getElementById(id) - 获取带有指定 id 的节点（元素）
- appendChild(node) - 插入新的子节点（元素）
- removeChild(node) - 删除子节点（元素）

一些常用的 HTML DOM 属性：

- innerHTML - 节点（元素）的文本值
- parentNode - 节点（元素）的父节点
- childNodes - 节点（元素）的子节点
- attributes - 节点（元素）的属性节点

Examples:

- <https://www.runoob.com/try/try.php?filename=try_changestyle1>
- <https://www.runoob.com/try/try.php?filename=try_changetext2>

当事件发生时，可以执行 JavaScript，比如当用户点击一个 HTML 元素时。

如需在用户点击某个元素时执行代码，请把 JavaScript 代码添加到 HTML 事件属性中：

onclick=JavaScript
HTML 事件的例子：

- 当用户点击鼠标时
- 当网页已加载时
- 当图片已加载时
- 当鼠标移动到元素上时
- 当输入字段被改变时
- 当 HTML 表单被提交时
- 当用户触发按键时

- <https://www.runoob.com/try/try.php?filename=trydhtml_event_onclick3>
- <https://www.runoob.com/try/try.php?filename=tryhtmldom_events2>
- <https://www.runoob.com/try/try.php?filename=tryhtmldom_events_onload>
- <https://www.runoob.com/try/try.php?filename=tryjsref_onchange>

**HTML DOM, JS 对象和浏览器对象等索引：<https://www.runoob.com/jsref/jsref-tutorial.html>**
