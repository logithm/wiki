---
title: "Geogebra使用备注"
date: 2018-10-24 10:06
---
[TOC]

## 截图/导出

1. 手工画图, 然后导出pgf/tikz, 再放到`standalone.tex`中生成pdf插入到`.tex`中去:  
    1. 把坐标系放大, 正常情况下$4\times 4$正好; 
    1. 图画好后, 将图放在第一象限, 最好贴着坐标轴, 理由在下一步;
    2. 在导出pgf/tizk代码时, 在对话框中填入$x_{\min},y_{\min}, x_{\max},y_{\max}$, 生成pgf/tikz代码; 
    3. documentclass选择为standalone, 拷贝代码, xelatex生成pdf.
![](../attach/geogebra001.png)  


## 画坐标系(箭头)
有时候, 我们不需要那么大的坐标系, 而是恰好大小的坐标系, 比如在$4\times 4$中, 不顶格的坐标轴的箭头


## 杂项
1. 高级选项中的任何修改, 都要返回上级菜单, 选择"保存设置". 

 
