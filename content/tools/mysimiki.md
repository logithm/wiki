---
title: "simiki 备忘"
date: 2018-03-19 09:00
updated: 2018-03-22 07:55
logs: "补充pangu"
---

[TOC]

## 初始化及部署到github上

### 工具准备
1. 安装python, 安装完成后 pip 也顺带安装了. 也许需要更新 pip.
1. 安装simiki库及其依赖库: `pip install simiki`. 
1. 注册github账户，并且创建 <username>.github.io 代码项目. 完成之后，应该可以通过该子域名访问到自己的page页面. 


### 环境配置
O. 修改root了吗? `root: /wiki`

A. 在github中创建wiki项目, 新建readme, 并创建gh-pages分支, 步骤如下: 

1. git clone git@github.com:logithm/wiki.git
1. cd wiki
1. git checkout -b gh-pages
1. git rm -rf .
注: 那不是句号的点.

B. 切换到master分支初始化simiki，生成content和themes目录和几个文件。并在output目录生成静态文件. 

1. git checkout master
1. simiki init
1. simiki g
1. simiki p --host 127.0.0.1 --port 8000 (可省)

ps: 这前3步其实就是初始化simiki, 然后第4步就是看看生成了什么, simiki p后在[http://127.0.0.1:8000](http://127.0.0.1:8000)预览. 
默认127.0.0.1:8000. 这个默认值, 作者在[issue90](https://github.com/tankywoo/simiki/issues/90)中提到了.

### 远程部署

gh-pages 分支中放wiki成品文件(即output目录中的所有文件), master分支用来备份除了output目录外的所有文件.

1. 根目录下(即 `wiki/`)新建.gitignore文件, 添加点内容:  `output/` , 目的是在master分支中将`output`目录过滤掉. 
而`output`目录要push到gh-pages分支. 
1. 将以下代码另存为[deploy.sh](https://raw.githubusercontent.com/tracholar/wiki/master/deploy.sh)文件, 保存到根目录下.   
```
if [ "$1" = "-i" ]
then
    mkdir output
    cd output
    git clone -b gh-pages git@github.com:logithm/wiki.git ./
    cd ..
    exit 0
elif [ "$1" = "" ]
then
    echo deploy [Option]
    echo "       -i 初始化"
    echo "       message  提交到github并发布，提交信息为mesage"
    exit 0
else
    git add . --all
    git commit -am "$1"
    git pull origin master
    git push origin master

    simiki g
    cd output
    mkdir src
    cp ../src/*.html src/
    cp ../src/*/*.html src/
    git add . --all
    git commit -am "$1"
    git pull origin gh-pages
    git push origin gh-pages
    cd ..

fi
```
注: 关于src的三行删掉.

3. 删除output目录先.
1. 该脚本提供两个功能，初始化和部署. 
	* 在cmder或者git bahs中, 输入 `deploy.sh -i`, 目的是初始化整个wiki内容.
	* `deploy.sh init-version` 提交部署到github上. 

那么现在就可以在[logithm.github.io/wiki/](logithm.github.io/wiki/) 看到内容了.

以上内容严重参考了[tracholar](http://github.com/tracholar)的wiki:[在github pages中使用simiki指南](https://tracholar.github.io/wiki/web/simiki.html).




## my config

### general
*  当前主题: [yasimple_x2](https://github.com/tankywoo/wiki.tankywoo.com/tree/master/themes). 
*  如果使用主题[yasimple_x2](https://github.com/tankywoo/wiki.tankywoo.com/tree/master/themes), [需要修改`_config.yml`中的`root`的选项](https://github.com/tankywoo/simiki/issues/23):  
```
root: /wiki
```
* `simiki new | n -t <title> -c <category> [-f <file>]`
    例子: `simiki n -c "Simiki" -t "linux" -f "xx.md"`
*  注释掉了 yasimple_x2 中的license与备案等信息, 在`yasimple_x2/base.html`中修改即可. 
*  修改`当前页面最后更新`为`更新`, 在`yasimple_x2/page.html`中. 
*  [关于多个终端同步的问题](https://github.com/tankywoo/simiki/issues/23): 
以github pages with domain 为例，master分支保存源文件、gh-pages分支保存生成的output内容。换一台电脑clone:  

```
    1. git clone -b master git@github.com:username/projectname.git
    2. cd projectname/
    3. git clone -b gh-pages git@github.com:username/projectname.git output
```

*  关于toc, 在Front Matter之后, 标题之前(标题其实也是文章内容), 添加 `[TOC]`, 一定要大写. 


### 关于mathjax

在`themes\yasimple_x2\base.html`的尾部, body内, 添加以下代码: 

```html
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"]  ],
        processEscapes: true,
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code'],
        processEscapes: true
      },
      TeX: {
        equationNumbers: { autoNumber: "AMS" }
      }
    });
</script>

<script type="text/x-mathjax-config">
    MathJax.Hub.Queue(function() {
      var all = MathJax.Hub.getAllJax(), i;
        for (i=0; i < all.length; i += 1) {
          all[i].SourceElement().parentNode.className += ' has-jax';
        }
    });
</script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/mathjax@2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
```

### 关于中英文混排空格

中英文混排时, 习惯在汉字与英文字母及数字之间留一空白, 此空白被成为"[盘古之白](https://github.com/vinta/pangu.js)". 
写md文件时, 并不需要故意加上这个空白, 跟写tex文件一样. 

[谢益辉](https://yihui.name/cn/2017/05/pangu/)修改了[pangu.js](https://github.com/vinta/pangu.js)的代码, 我将谢的代码放到 `themes\yasimple_x2\base.html`中了, body之前即可.
```
<script type="text/javascript">
(function(u, c) {
  var d = document, t = 'script', o = d.createElement(t),
      s = d.getElementsByTagName(t)[0];
  o.src = u;
  if (c) { o.addEventListener('load', function(e) { c(e); }); }
  s.parentNode.insertBefore(o, s);
})('//cdn.bootcss.com/pangu/3.3.0/pangu.min.js', function() {
  pangu.spacingPage();
});
</script>
```

在单个html文件中, 竟然却没有发现空格, 奇怪. (20180322)


### newline 与 hard break(未解决)
python-markdown的[New-Line-to-Break Extension](https://python-markdown.github.io/extensions/nl2br/)(缩写为nl2br)的目的是: 
> The New-Line-to-Break (nl2b) Extension will cause newlines to be treated as hard breaks.

实际使用: 去掉nl2br选项, 即为false. 而作者的[_config.yml](https://github.com/tankywoo/wiki.tankywoo.com/blob/master/_config.yml)中有如下代码, 添加到自己的`_config.yml`中, 再 用Sublime可以增加设置 `"default_line_ending": "unix"`. 
```
markdown:
  - fenced_code
  - extra
  - codehilite(css_class=hlcode, linenums=False)
  - toc(title=Table of Contents)
```
变通的做法: 编辑器中开启word wrap.
注: 上面的代码没发现起了什么作用, 那就是说在当前版本(v1.6.2.1)中是默认开启的. (20180322)
注: 作者[默认nl2br开启](https://github.com/tankywoo/simiki/blob/master/CHANGELOG.rst#v162-2017-06-02).
注: [python-markdown的extensions](https://python-markdown.github.io/extensions/).



### 关于插图

<del> 在 `themes\yasimple_x2\static` 下新建 `images` 目录, 把图片丢进去, 图片引用语法为 `![](/images/xxx.png)`, 远程是正确的, 本地是错误的. 
本地预览语法 `![](/wiki/images/xxx.png)`. </del> (2018-03-20)

simiki的插图等事宜, 参见[simiki的文档](http://simiki.org/zh-docs/configuration.html)中的attach关键词. 插图语法: `![](../attach/xxx.png)`, 本地远程皆正常. (2018-03-20)
