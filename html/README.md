# Something to play around

### HTML quicklist

- <https://www.runoob.com/html/html-quicklist.html>
- tagname: <https://www.runoob.com/html/html-tag-name.html>

### HTML layout

- <https://www.runoob.com/try/try.php?filename=tryhtml_layout_divs>
- <https://www.runoob.com/try/try.php?filename=tryhtml_layout_tables>

![](https://www.runoob.com/wp-content/uploads/2013/07/html5-layout.jpg)

### HTML form

- <https://www.runoob.com/try/try.php?filename=tryhtml_form_demo>

> docs: <https://www.runoob.com/html/html-forms.html>


- input: <https://www.runoob.com/html/html5-form-input-types.html>
- <https://www.runoob.com/html/html5-form-elements.html>
- attrs: <https://www.runoob.com/html/html5-form-attributes.html>

### HTML color names

- <https://www.runoob.com/html/html-colornames.html>

### HTML script

- <https://www.runoob.com/try/try.php?filename=tryhtml_noscript>

### HTML symbols

- <https://www.runoob.com/html/html-entities.html>


### HTML url

- <https://www.runoob.com/html/html-url.html>
- <https://www.runoob.com/tags/html-urlencode.html>

### HTML5

- <https://www.runoob.com/html/html5-intro.html>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_video_bear>

HTML5 是 W3C 与 WHATWG 合作的结果,WHATWG 指 Web Hypertext Application Technology Working Group。

WHATWG 致力于 web 表单和应用程序，而 W3C 专注于 XHTML 2.0。在 2006 年，双方决定进行合作，来创建一个新版本的 HTML。

HTML5 中的一些有趣的新特性：

用于绘画的 canvas 元素
用于媒介回放的 video 和 audio 元素
对本地离线存储的更好的支持
新的特殊内容元素，比如 article、footer、header、nav、section
新的表单控件，比如 calendar、date、time、email、url、search

Minimal HTML5

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文档标题</title>
</head>

<body>
文档内容......
</body>

</html>
```

HTML5 的改进
新元素
新属性
完全支持 CSS3
Video 和 Audio
2D/3D 制图
本地存储
本地 SQL 数据
Web 应用


### Canvas

- <https://www.runoob.com/html/html5-canvas.html>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_canvas_first>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_canvas_tut_path2>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_canvas_tut_img>
- Refs: <https://www.runoob.com/tags/ref-canvas.html>


### SVG

- <https://www.runoob.com/html/html5-svg.html>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_svg_ex>

SVG 是一种使用 XML 描述 2D 图形的语言。

Canvas 通过 JavaScript 来绘制 2D 图形。

SVG 基于 XML，这意味着 SVG DOM 中的每个元素都是可用的。您可以为某个元素附加 JavaScript 事件处理器。

在 SVG 中，每个被绘制的图形均被视为对象。如果 SVG 对象的属性发生变化，那么浏览器能够自动重现图形。

Canvas 是逐像素进行渲染的。在 canvas 中，一旦图形被绘制完成，它就不会继续得到浏览器的关注。如果其位置发生变化，那么整个场景也需要重新绘制，包括任何或许已被图形覆盖的对象。

### HTML mathml

- <https://www.runoob.com/try/try.php?filename=tryhtml5_mathml_css3>

### HTML Draggable

Fun thing!

- <https://www.runoob.com/html/html5-draganddrop.html> 逻辑很重要
- <https://www.runoob.com/try/try.php?filename=tryhtml5_draganddrop>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_draganddrop2>

### HTML nav

- <https://www.runoob.com/try/try.php?filename=tryhtml5_nav>

### HTML webstorage

**键值对**

客户端存储数据的两个对象为：

localStorage - 用于长久保存整个网站的数据，保存的数据没有过期时间，直到手动去除。
sessionStorage - 用于临时保存同一窗口(或标签页)的数据，在关闭窗口或标签页之后将会删除这些数据。

- <https://www.runoob.com/try/try.php?filename=tryhtml5_webstorage_local>

不管是 localStorage，还是 sessionStorage，可使用的API都相同，常用的有如下几个（以localStorage为例）：

保存数据：localStorage.setItem(key,value);
读取数据：localStorage.getItem(key);
删除单个数据：localStorage.removeItem(key);
删除所有数据：localStorage.clear();
得到某个索引的key：localStorage.key(index);

- <https://www.runoob.com/try/try.php?filename=tryhtml5_webstorage_session>
- Web Storage 开发一个简单的网站列表程序: <https://www.runoob.com/try/try.php?filename=tryhtml5_webstorage_demo>

### HTML web SQL

- <https://www.runoob.com/html/html5-web-sql.html>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_websql>
- <https://www.runoob.com/try/try.php?filename=tryhtml5_websql2>

### HTML web worker

- <https://www.runoob.com/try/try.php?filename=tryhtml5_webworker>

### HTML Server-Sent Events !!!

- <https://www.runoob.com/try/try.php?filename=tryhtml5_sse>

### HTML websocket !!!

WebSocket 使得客户端和服务器之间的数据交换变得更加简单，允许服务端主动向客户端推送数据。在 WebSocket API 中，浏览器和服务器只需要完成一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输。

浏览器通过 JavaScript 向服务器发出建立 WebSocket 连接的请求，连接建立以后，客户端和服务器端就可以通过 TCP 连接直接交换数据。

WebSocket 协议本质上是一个基于 TCP 的协议。

- <https://www.runoob.com/html/html5-websocket.html>
