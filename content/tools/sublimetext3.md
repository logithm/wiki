---
title: "sublime text 3"
date: 2018-04-02 22:01
---

## 功能,快捷键,config

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


1. sublime中打开cmder
    * 安装插件terminal
    * 设置terminal, 在Preferences->Package Settings->Terminal->Settings-User中，输入下面内容
```
	{
    // 输入cmder路径
    "terminal": "C:\\program files\\cmder\\Cmder.exe",
    // 通过设置自定义快捷键，使用命令"open_terminal" 或者
    // "open_terminal_project_folder"打开终端
    "parameters": ["/START","%CWD%"]
	}
```

    * 自定义打开终端快捷键: Preferences->Key Bindings - User，输入下面内容  

```
  { "keys": ["ctrl+alt+t"],"command": "open_terminal"}
```



## todo
1. 配置各种文件的 ctrl+b
	* latex
	* md
	* pandoc: ...

1. [st3的同步: 官方教程](https://packagecontrol.io/docs/syncing)

1. [st3的一些设置](https://jdhao.github.io/2017/03/19/windows-sublime-usage-related-issue/): 好.

1. [st3与markdown](https://jdhao.github.io/2017/03/04/Sublime-Windows-Markdown/)


## 注册码

1. ---[st3](https://9iphp.com/web/html/sublime-text-3-license-key.html)---
```
—– BEGIN LICENSE —–
Morin
2 User License
EA7E-924018
184B9FDB 02612F57 33B15E69 BBC567F1
E20FA231 C077EA95 CC14B48B 71DD2536
E209843A 94D13692 03AC2FAA 895B688D
B8F4A0E6 FDC15964 A5573FD7 6405ED1E
6F205469 7F34C69D 3D36E475 52AF6A5B
DFD15C31 85BA64EF F95DD592 4B42C314
AC655762 C0F0F5A1 018824E4 17C56E16
AC5AA84C 034F7A53 2C9A801B 8AED239F
—— END LICENSE ——
```
1. st3 code
```
—– BEGIN LICENSE —–
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
—— END LICENSE ——
```

