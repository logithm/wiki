---
title: "LaTeX"
date: 2018-03-28 13:56
---

## enumitem宏包

1. 参数
* vertical spacing: topsep, partopsep, parsep, itemsep
* horizontal spacing: leftmargin, rightmargin, listparindent, labelwidth, labelsep, itemindent

1. key
label, ref, font, format, align=left/right/parleft, setlabelalign

1. [自定义列表环境, 用于例题](https://tex.stackexchange.com/questions/64413/formatting-for-body-of-item-in-itemize-enumerate-description-environment): 
前提是enumitem宏包, 实现列表头与主体(关键是\before)都是楷体. 
```
\newlist{litilist}{enumerate}{2}
\setlist[litilist,1]{label=例\thelitilisti., before=\kaishu, font=\kaishu }
```
1. 还是自定义列表
```
\newcount{toplist}
\setcount{toplist}{1}
\newcommand{\mylistname}{enumerate}
\setlist[\mylistname,\value{toplist}+1]{labelsep=\itemindent+2em]
```
上述例子是enumitem的manual给的, 有几个错误, 修改如下:
```
\newcounter{toplist}
\setcounter{toplist}{1}
\newlist{mylistname}{enumerate}{2}
\setlist[mylistname,\value{toplist}]{label=\themylistnamei., resume}
```

## tips
1. 数学函数名用正体显示, 斜体表示变量. 
临时用一下函数名(通常是只用有限的几次), 可以直接写成: \operatorname{rank}(x) 就可以了.



## 宏包简要说明
1. epigraph: 章节头名言
1. times和txfonts宏包已过时, 很多bug, 尽量用 mathptmx 或 newtxtext, newtxmath 宏包.
1. parskip: 段首缩进宏包. \paragraph是\subsection的下一层.


## 我的宏包设置(2016.12)
1. 列表环境:
		* 不用enumerate宏包: 该宏包只是给 enumerate 环境增加了一可选项，用来设定列表项的数字的形式。
		* 用enumitem.
		* iitem宏包: 实现多级列表. 宏包很小.

```
\begin{enumerate}
\item 1
\iitem (1)
\item 2
\iitem (1)
\iitem (2)
\iiitem i
\item 3
\end{enumerate}
```

2. 不要indent
3. 例题/定理/定义全部按照section计数

4. 如何安装宏

如果得到的宏包是已经编译过的，也就是已经有 .sty 或者 .cls 文件，只需把这些文件放在
localtexmf\tex\latex\ 下的某个子目录中， 可以自己建一个。然后还要让TEX知道这个新的
宏包的存在， 需要刷新TEX系统的文件名数据库。现在你可以使用这个宏包了。
也可以把这些宏包文件和要编辑的TEX源文件放在同一目录下， 这种情况下不需要刷新TEX
系统的文件名数据库， 但只有同一个目录下的文件可以使用这些宏包。
如果得到的是宏包的源文件，一般来说都包含两个文件： 一个扩展名为 .ins ，另一个扩展
名为 .dtx 。 此外，通常会有一个 readme.txt 对宏包进行简要的说明。 现在需要两个步骤将它
安装到TEX系统中：

	(1). 生成样式文件并装入系统:
			<1>. 对 .ins 运行LaTeX命令。 这将会产生一个或若干个 .sty 文件
			<2>. 把 .sty 文件移到系统能找到的地方。 通常是 …/localtexmf/tex/latex 子目录下(Windows 或者 OS/2 用户应该改变斜线为反斜线)
			<3>. 刷新系统的文件名数据库。参照上一节的说明

	(2). 生成说明文档
			<1>. 对 .dtx 文件运行LaTeX命令。 这将会产生一个 .dvi 文件。 注意：可能需要多次运行LaTeX来正确处理交叉引用
			<2>. 检查一下LaTeX是否产生了 .dvi 文件。 如果没有发现这个文件，就可以执行第 5 步了。
			<3>. 为了生成索引，键入命令：makeindex -s gind.ins name (这里 name 表示不带扩展名的主文件名)
			<4>. 再次对 .dtx 文件运行 LA T E X 命令。
			<5>. 最后一步不是必需的，生成 .ps 文件或者 .pdf 文件以方便阅读。

有时会发现生成了一个 .glo(glossary) 文件。 在第 4 步和第 5 步之间运行下面的命令



makeindex -s gglo.ist -o name.gls name.glo

确认在执行第 5 步前最后对 .dtx 文件运行一遍LaTeX 命令。


5. 建立自己的宏包

如果建立了很多自己的环境和命令，文档导言部分将变得很长， 在这种情况下，建立一个新的
LaTeX包来存放所有自定义的命令和环境是一个好的处理方式。可以在文档中使用 \usepackage
命令来引入中定义宏包中的环境和命令。
写一个宏包的基本工作就是将文档导言复制到一个分离的文件中去， 这个文件要以 .sty 结
尾。还需要一个命令：\ProvidesPackage{package_name} 

这个命令应该在包定义源文件的最前面使用。它用于告诉 LaTeX宏包的名称从而允许LaTeX
在你尝试两次引入同一个宏包的时候给出一个良好的错误信息。







## 一些宏包
10. [zhlipsum 随机填充汉字](https://github.com/Stone-Zeng/zhlipsum)

9. [wrapfig宏包可以实现左右排版](1-1.tex): 但是不能与列表环境互相嵌入.
``` latex
\begin{wrapfigure}[12]{r}[34pt]{5cm}
\begin{tikzpicture}
....
\end{tikzpicture}
\end{wrapfigure}
``` 


1. [floatrow宏包](http://www.latexstudio.net/hulatex/package/float.htm), 使用实例参见[ab_preamble.tex](https://github.com/jermer/alg-book)  

1. [setspace宏包少用](http://bbs.ctex.org/forum.php?mod=viewthread&tid=68537)  

1. [epigraph宏包用来写章节头上的一句名人名言](http://www.cnblogs.com/Eufisky/p/3801317.html)

1.  做个glossary(名词/术语索引)还是很有作用的. 使用实例参见[ab_preamble.tex](https://github.com/jermer/alg-book).  

1. [ab_preamble.tex](https://github.com/jermer/alg-book)中的插图(一行多图)可以参考.  





## other to 整理

1. 无序列表环境: 其中的51指的是\ding{51}这个符号

```
\begin{dinglist}{51} 
\item 内容 
\item 内容 
\end{dinglist} 
```


12. [跨页表格/代码框](http://www.latexstudio.net/archives/10645) 还不错的book类

13. [开源微积分巨著《APEX Calculus》](http://www.latexstudio.net/archives/10627) [latex排版](https://github.com/APEXCalculus/APEXCalculus_Source)

3. [反复引用同一个脚注](http://bbs.ctex.org/forum.php?mod=viewthread&tid=65541)

1. 关于页码的显示: 第3页/共10页(3/10), \pageref{LastPage}

```
\fancyfoot[LE,RO]{\textbf{\thepage/\pageref{LastPage}}}
```

1. 蓝色分割线, 中间写上点内容. 使用: \fengexian{内容}

```
\newcommand{\fengexian}[1]{
\pagebreak[3]
\begin{center}
\textcolor{blue}{\hrulefill\hspace{3em}\textsc{#1}\hspace{3em}\hrulefill}
\end{center}}
```

1. 两栏: 左代码右输出

```
\usepackage{verbatim,xcolor}
\newbox\savedlines
\newtoks\savedtokens
\makeatletter
\def\codeshow{%
\global\savedtokens={}%
\def\verbatim@processline{%
{\setbox0=\hbox{\the\verbatim@line}%
\hsize=\wd0
\the\verbatim@line\par}%
\global\savedtokens=\expandafter{\the\expandafter\savedtokens\the\verbatim@line^^J}}%
\@tempswatrue
\setbox0=\vbox\bgroup\parskip=0pt\topsep=0pt\partopsep=0pt
\verbatim}
\def\endcodeshow{\endverbatim%
\unskip\setbox0=\lastbox\egroup
\global\setbox\savedlines=\box0
\addvspace{1em}\par\noindent%
\colorbox{lightgray}{%
\begin{minipage}{.55\textwidth}{\usebox\savedlines}\end{minipage}}%
\hfill\fbox{\parbox{.40\textwidth}%
{\scantokens\expandafter{\the\savedtokens\unskip\endinput}}}%
\par\addvspace{1em}}
\makeatother
```

使用方法:

```
\begin{codeshow}
\begin{tikzpicture}
\draw[blue](0,0)circle(1cm);
\end{tikzpicture}
\end{codeshow}
```

ps: 目前代码部分是灰色(lightgray)的背景, 输出部分是黑色的方框围绕.

1. 左边显示代码，右边显示编译结果的代码展示环境: 需要listing, tcolorbox宏包

```
\lstdefinestyle{codeshow}
{   basicstyle=\small\ttfamily, % \ttfamily等宽字体
    aboveskip=0pt,% 上边距
    belowskip=0pt,% 下边距
    lineskip=0pt,
    tabsize=4,% 设置tab空格数
    showtabs=false,% tab
    showspaces=false,% 空格标识
    showstringspaces=false,
    boxpos=c,
    xleftmargin=5pt,% 左边距
    xrightmargin=0pt,
    breaklines=true,% 自动换行
    breakindent=0pt,% 换行后缩进为0
}

\newtcblisting{mycodeshow}{
   colback=red!5!white,
colframe=red!75!black,
    breakable,
    boxrule=0.5pt,% 去除文本框线
    arc=0mm,% 内弧
    outer arc=0mm,% 外弧
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    listing outside text,
    listing options={
        style=codeshow,
    }
}
```

使用方法:

```
\begin{mycodeshow}
\begin{tikzpicture}
\draw[blue](0,0)circle(1cm);
\end{tikzpicture}
\end{mycodeshow}
```

1. 与tcolorbox相似功能的宏包mdframe.

2. \documentclass[fleqn]{book}: left-justified equations

3. 带圈数字的实现方法 ps: 用calc宏包, +171似乎更好, 如下:

```
% 带圈数字，不能超过10个
\def\@circlenum#1{
    \ding{\the\numexpr\value{#1}+171\relax}%
}
```

1. 源代码与 pdf 文件之间的反向搜索问题

让编辑器都自动实现，需要配置好相关参数，这个参数即:-synctex=1或 synctex=1

2. winedt怎么默认以utf8打开编辑文档?

(1)% !Mode:: “TeX:UTF-8” 每个文档头都需要添加这一行代码
(2)在options - configuration wizard - wrapping 下 UFT-8 format中加上Tex，改成 Tex;UTF-8|ACP;EDT;INI 就可以了。这样所有的tex文档都被默认是utf-8文档打开。
但是winedt还没有办法很好支持两种以上的utf-8文档，比如同时输入中文和韩语。
ps: 目前我的winedt中没有进行(2)中的动作.






## latex宏包更新冲突
1. caption2宏包已经obsoleted了,现在是caption宏包.  
参见: [1](http://bbs.ctex.org/forum.php?mod=viewthread&tid=62251), [2](http://ctan.org/pkg/caption), [3](http://bbs.ctex.org/forum.php?mod=viewthread&tid=63504).  
ps: main46的package.tex中已经修改.

2. [hyperref宏包是最容易冲突](http://blog.sina.com.cn/s/blog_5e16f1770100ju9l.html)

3. [pdf文档属性中的中文乱码, hyperref宏包此时要求utf8.](http://bbs.ctex.org/forum.php?mod=viewthread&tid=45405)

4. enumitem宏包是什么?
列表宏包, 有resume选项. 貌似可以把enum宏包给替换了.

5. itemize的各种缩进: [3楼有解释](http://bbs.ctex.org/forum.php?mod=viewthread&tid=38713)
一个例子:

```
\begin{itemize}\setlength{\labelsep}{0.5em}
\item a
\item b
\item[\smiley]第三个变换相较于前两个,有点无力.
\end{itemize}
```

1. [hypernat宏包现在不需要了](http://bbs.ctex.org/forum.php?mod=viewthread&tid=56735): 因为natbib 和 hyperref 现在配合得很好

2. ddd
		* biber 代替 bibtex
		* polyglossia 代替 babel
		* xindy 代替 makeindex
		* 画图用 TikZ + Asymptote 分工，代替 MetaPost、PSTricks 和 xfig等等其他所有绘图包。
以上来自[邓博元](https://www.zhihu.com/question/21088362/answer/29312831)


