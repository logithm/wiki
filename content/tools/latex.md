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

