---
title: "cmder"
date: 2018-03-20 07:50
---

[TOC]


![sss](../attach/001.png)


## general
1. version1.3.5

1. 把cmder添加到系统环境变量, 即windows下的path. 

1. 添加鼠标右键及删除
    * 添加右键: `Cmder.exe /REGISTER ALL`
    * 删除右键: 新建一文件`*.bat`, 内容如下: 

```
@echo off
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\Background\shell\Cmder" /f
pause
```

1. 打开设置界面: win+alt+p

1. 文字重叠问题: 设置界面 > main > main console font > monospce, 去掉勾.

1. [修改命令提示符号λ](https://www.jianshu.com/p/479d974078a7)
修改文件 ${CMDER_HOME}\vendor\clink.lua
```
    if env == nil then
        lambda = "λ"
    else
        lambda = "("..env..") λ"
    end
```
改为: 
```
    if env == nil then
        lambda = "$"
    else
        lambda = "("..env..") $"
    end
```
注: 1.3以后版本如此, 之前是之前的改法.



1. ls中文乱码
<del> Startup > Environment > Set up environment variables 添加`set LANG=zh_CN.UTF8`, 重启cmder. </del> 
	* 命令行下, locale查看是否成功.
	* 注意要在适当的地方加上分号, 否则重启后添加的代码就消失了. 但这不是此法失效的理由, 换成`set LC_ALL=zh-CN.UTF8`也没用. (2018-03-21)  
	* 代码未必消失, 大概是没有保存好, 动作太快了. 反正莫名其妙就好了. 奇葩. (2018-03-21)
	* 在`C:\Program Files\cmder\vendor\conemu-maximus5\ConEmu.xml`中的`<value name="EnvironmentSet" type="multi">`下一行, 
直接添加代码`<line data="set LANG=zh_CN.UTF-8"/>`. 其他修改类似. (2018-03-22)



1. [设置alias](http://imweb.io/topic/56b072d05c49f9d377ed8ee2): 修改config/user-aliases.cmd文件. 
比如: `st="C:\Program Files\Sublime Text 3\sublime_text.exe"`, 意味在cmder中输入st即可打开sublime text.



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




### 参考

[cmder & cygwin 中文支持解决方案](https://lfire.github.io/2017/03/08/cmder-cygwin-chinese/), 
[神器 cmder](https://lfire.github.io/2017/03/02/cmder/)


