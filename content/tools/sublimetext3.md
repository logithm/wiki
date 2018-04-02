---
title: "sublime text 3"
date: 2018-04-02 22:01
---

# 功能,快捷键,config

1. rename file: ctrl+shift+p, rename

1. del file: ctrl+shift+p, del

1. 一个字体的设置
```
{
    "font_options": ["no_italic", "directwrite"],
}
```
"no_italic" 可以禁止掉斜体样式，"directwrite" 可以使中文也渲染的很好看（只针对Windows 系统）.

1. [关于`"word_separators"`选项](https://www.zhihu.com/question/24896283/answer/145620671):  
控制默认的分词分割符, 用于自动完成的词条. 

1. [关于主题的某种设置](https://www.zhihu.com/question/46266742/answer/136684944): 
```
"ui_fix_tab_labels":  true
```

1. theme 与 color theme: theme 改变的是整个project的骨架风格, color theme控制的是编辑区的背景/高亮等.

1. 按住鼠标中键（滚轮键）拖动选区可以进行垂直选择, 等价方法: 鼠标右键 + Shift

1. 按变量名选择: ctrl+d. 用于修改全文中的全部出现的某个变量.


# todo
1. 配置各种文件的 ctrl+b
	* latex
	* md
	* pandoc: ...

1. [st3的同步: 官方教程](https://packagecontrol.io/docs/syncing)
