---
title: "tikz tips"
date: 2018-10-24 10:25
---


## 例子
1. tikzlog-1405.pdf: xyz轴指向的自定义(P18)
```latex
\begin{tikzpicture}[x={(-.1cm,-.15cm)},y={(1cm,0cm)},z={(0cm,1cm)}]
\draw[->] (-5,0,0) -- (5,0,0) node[below] {$x$};
\draw[->] (0,-2,0) -- (0,2,0) node[right] {$y$};
\draw[->] (0,0,-1) -- (0,0,3) node[above] {$z$};
\draw[color=red] plot[domain=0:2*pi] ({sin(\x r)},{cos(\x r)},2);
\draw[color=red] (0,0,0) -- (0,1,2) (0,0,0) -- (0,-1,2);
\end{tikzpicture}
```