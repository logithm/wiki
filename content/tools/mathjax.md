---
title: "mathjax"
date: 2018-03-31 08:55
---

## general

1. [加载和配置MathJax](http://mathjax-chinese-doc.readthedocs.io/en/latest/configuration.html): 官方中文版mathjax2.0

1. [去掉蓝框](http://www.cnblogs.com/tianshifu/p/6388391.html): 添加CSS去掉，如下
```
.MathJax{outline:0;}
```

1. 在HTML-CSS添加可用字体，如下
```
"HTML-CSS": {
    availableFonts: ["STIX","TeX"]
}
```

1. 去掉公式右击菜单: 在HTML-CSS添加设置，如下
```
"HTML-CSS": {
    showMathMenu: false
}
```

1. 去掉加载信息: Mathjax.js在加载的时候，我们可以再网页左下角看到加载情况，可以直接在MathJax.Hub.Config()里配置去掉，如下
```
MathJax.Hub.Config({
    showProcessingMessages: false,
    messageStyle: "none"
});
```




## 一些例子
### kuing
[kuing的MathJax配置方法](http://kuing.is-programmer.com/posts/205614.html)
```
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true 
    },
    TeX: {
      equationNumbers: { autoNumber: "AMS" },
      Macros: {
        mbb: '\\mathbb',
        riff: '\\implies',
        liff: '\\impliedby',
        abs: ['\\left\\lvert #1\\right\\rvert', 1],
        rmd: '\\mathop{}\\!\\mathrm{d}',
        vv: '\\overrightarrow',
        sslash: '\\mathrel{/\\mkern-5mu/}',
        px: '\\mathrel{/\\mkern-5mu/}',
        pqd: '\\stackrel{\\,\\sslash}{\\raise-.5ex{=\\!\\!\\!\\!=}}',
        veps: '\\varepsilon',
        du: '^\\circ',
        bsb: '\\boldsymbol',
        bm: '\\boldsymbol',
        kongji: '\\varnothing',
        buji: '\\complement',
        S: ['S_{\\triangle #1}', 1],
        led: '\\left\\{\\begin{aligned}',
        endled: '\\end{aligned}\\right.',
        edr: '\\left.\\begin{aligned}',
        endedr: '\\end{aligned}\\right\\}',
        an: '\\{a_n\\}',
        bn: '\\{b_n\\}',
        cn: '\\{c_n\\}',
        xn: '\\{x_n\\}',
        Sn: '\\{S_n\\}',
        inR: '\\in\\mbb R',
        inN: '\\in\\mbb N',
        inZ: '\\in\\mbb Z',
        inC: '\\in\\mbb C',
        inQ: '\\in\\mbb Q',
        Rtt: '\\text{Rt}\\triangle'
      }
    },
    "HTML-CSS": {
      linebreaks: {automatic: true}
    },
      menuSettings: {
        zoom: "Double-Click"
    }
  });
</script>
 
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
```



### 避开特殊标签和Class
```
MathJax.Hub.Config({
    tex2jax: {
        inlineMath:  [ ["$", "$"] ],
        displayMath: [ ["$$","$$"] ],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre','code','a'],
        ignoreClass:"class1"
    }
});
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
```
> 其中skipTags用来避开一些特殊的标签，这里避开是script,noscript,style,textarea,pre,code,a的标签内  
> ignoreClass用来避开标签内声明的CSS Class属性，这里避开的是带有class="class1"的标签内  
> 如果我们不想让mathjax识别评论里的公式就可以用ignoreClass  
> 如果有多个Class需要避开，我们可以通过 | 来区分，写成ignoreClass: "class1|class2"基于可以了  


## 参考
1. [前端整合MathjaxJS的配置笔记](https://www.linpx.com/p/front-end-integration-mathjaxjs-configuration.html)


