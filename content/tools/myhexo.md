---
title: "hexo"
date: 2018-10-24 11:28
---



##  todo hexoblog

1. [blog html5 slides](http://www.lancezhange.com/2015/11/24/iframe-for-presentation-embedding/)
[嵌入html5,用js](http://www.lancezhange.com/2015/11/23/jmpress-js-in-hexo/)

1. [about mathjax](http://www.lancezhange.com/2015/05/18/Hello-Hexo-and-Goodbay-Octopress/)

1. [maupassant主题](https://www.haomwei.com/technology/maupassant-hexo.html)

1. [simple](http://isnowfy.github.io/): 在github上写博客的更简单的方式.

1. [grav:建blog工具](https://getgrav.org/): 不要用, 可能需要自己搭建php服务器. [理由](https://blog.jamespan.me/posts/blogging-in-non-static-way)

1. [typecho: blog平台](http://typecho.org/). 去折腾这些平台其实没有多大必要, 并且有了hexo已经够好的了, 重要的是内容. (20180327)

1. [hexo-next](https://jdhao.github.io/2017/02/26/hexo-install-use-issue/)

1. [hexo-toc](https://github.com/bubkoo/hexo-toc)可行

1. freemind主题修改post的标题大小在 `themes\freemind\source\css\style.ss`中


5. [用github Pages和Jekyll搭建blog](http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html),
[另一种教程](http://www.cnfeat.com/blog/2014/05/11/how-to-build-a-blog/),   

[还有](https://www.ezlippi.com/blog/2015/03/github-pages-blog.html)  
> 在该目录下手动创建如下文件和文件夹，最终形成这样的结构：  
    *  _includes：默认的在模板中可以引用的文件的位置，后面会提到  
    *  _layouts：默认的公共页面的位置，后面会提到  
    *  _posts：博客文章默认的存放位置  
    *  .gitignore：git将忽略这个文件中列出的匹配的文件或文件夹，不将这些纳入源码管理  
    *  _config.yml：关于jekyll模板引擎的配置文件  
    *  index.html：默认的主页  

1.     

## Done

1. [博客内部链接: pages之间的互相链接](https://qiwulun.github.io/posts/用Hexo和Org写博客──站内链接.html).   
    * 首先, `_config.yml`中, 将 
    ```permalink: :year/:month/:day/:title/```  
    修改为 
    ```permalink: _post/:title.html```.     
    * 其次, 比如要在`about`页面上链接`maxim`页面, 只要 `[maxim](../maxim)`即可. 注意是两个`..`, 也不需要加`.html`后缀. 
    另外, `[隔三差五](../categories/隔三差五/)`也是正确的.  
    * 再次, 博客内部某博文链接到另一博文: `{% post_link blog.md %}`, 其中`blog.md`就是那个目标博文的md文件.
2. 插图问题, 解决为 `![](../../../../images/001.png)` . 2018-02-16
3. 换行问题参见: {% post_link hexo %}

1. 今天比较兴奋的是通过wixo/freemind这两个主题, 发现几个好玩的博客. 2018-02-27
