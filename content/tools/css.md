---
title: "css笔记"
date: 2018-03-23 21:22
update: 2018-03-23
---
[TOC]

## general

### html中加载css样式的4种方法  
1. 内联式
在html文件上直接写
```
<p style="font-size:18px;">此处是测试文字</p>
```


2. 内嵌式
把css全部写在html文件中, 集中在一起, 即在`<head></head>`里写上
```
<style type="text/css">
	h3 { color:#f00;}
</style>
```

1. 外部式  
css是一个外部文件时, 在html文件的`<head></head>`里写上  
```
<link href="\css\mystyle.css" rel="stylesheet" type="text/css" />
```


4. 导入式
html中需要有`<style type="text/css">  </style> `, 而css调用css就不需要这个头尾, 而是直接`@import`. 
```
<style type="text/css"> 
	@import url("mystyle.css");
</style>  
```
导入样式是以`@import url`标记所链接的外部样式表，它一般常用在另一个样式表内部。如index.css为主页所用样式，那么我们可以把全局都需要用的公共样式放到一个mypublic.css的文件中，然后在index.css中以`@import url("/mypublic.css") `的形式链接全局样式，这样就使代码达到很好的重用性。

这种方式不推荐使用，因为@import有个小缺陷，它会等到页面全部被加载完再被加载，当用户的网速较慢时，会出现一段页面没有CSS样式的时间，等全部加载好了才能看到样式。(当前业界形态下, 速度不是个问题. )

四种样式的优先级：内联式>嵌入式>外部式>导入式. 

`@import`与`link`的区别:

* link引用的CSS在HTML文件一开始加载的时候开始加载，而@import引用的CSS会等到页面全部被加载完再被加载；
* @import可以引入多个样式表集合到同一个文件；
* 当使用javascript控制dom去改变样式的时候，只能使用link标签，因为@import不是dom可以控制的。


参考:  
[html-加载css样式的4种方法](https://blog.csdn.net/appleLg/article/details/75433606)  
[高性能网站设计：不要使用@import](https://www.qianduan.net/high-performance-web-site-do-not-use-import/)




## 静态网页的css设计



