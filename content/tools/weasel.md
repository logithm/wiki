---
title: "weasel"
date: 2018-04-10 08:53
---

## general

1. [RIME／中州韵输入法引擎(windows版本称为小狼毫/Weasel)](http://rime.im/)

### [Rime 中的數據文件分佈及作用](https://github.com/rime/home/wiki/RimeWithSchemata)
1. 共享資料夾
	* 【中州韻】 /usr/share/rime-data/  
	* 【小狼毫】 "安裝目錄\data"
	* 【鼠鬚管】 "/Library/Input Methods/Squirrel.app/Contents/SharedSupport/"

	共享資料夾包含預設輸入方案的源文件。 這些文件屬於 Rime 所發行軟件的一部份，在訪問權限控制較嚴格的系統上對用戶是只讀的，因此謝絕軟件版本更新以外
	的任何修改—— 一旦用戶修改這裏的文件，很可能影響後續的軟件升級或在升級時丟失數據。

1. 用戶資料夾
	* 【中州韻】 ~/.config/ibus/rime/ （0.9.1 以下版本爲 ~/.ibus/rime/）  
	* 【小狼毫】 "%APPDATA%\Rime"
	* 【鼠鬚管】 ~/Library/Rime/  

在「部署 Rime」操作時，將用到這裏的輸入方案源文件、並結合用戶定製的內容來編譯預設輸入方案。

用戶資料夾則包含爲用戶準備的內容，如：

  * default.yaml:〔全局設定〕 
  * weasel.yaml:〔發行版設定〕 
  * <方案標識>.schema.yaml:〔預設輸入方案副本〕 
  * installation.yaml: ※〔安裝信息〕 
  * user.yaml: ※〔用戶狀態信息〕 

編譯輸入方案所產出的二進制文件：

  * <方案標識>.prism.bin:〔Rime 棱鏡〕 
  * <詞典名>.table.bin:〔Rime 固態詞典〕 
  * <詞典名>.reverse.bin:〔Rime 反查詞典〕 

記錄用戶寫作習慣的文件：

  * ※〔用戶詞典〕 <詞典名>.userdb.kct
  * ※〔用戶詞典快照〕 <詞典名>.userdb.txt、<詞典名>.userdb.kct.snapshot 見於同步文件夾

以及用戶自己設定的：

  * default.custom.yaml: ※〔用戶對全局設定的定製信息〕 
  * <方案標識>.custom.yaml: ※〔用戶對預設輸入方案的定製信息〕 
  * ※〔用戶自製輸入方案〕及配套的詞典源文件

註：以上標有 ※ 號的文件，包含用戶資料，您在清理文件時要注意備份！

ps: 以上内容完全来自于官网的文档. 


### 备注

1. 鼠标跟随: 最新版本(weasel-0.11.0.0-installer)已经支持sublime text 3中的鼠标跟随了.

1. [模糊音设置](https://gist.github.com/lotem/2320943)

1. Rime\default.custom.yaml:

```
  patch:
  "menu/page_size": 9   

```  

1. Rime\build\luna_pinyin.schema.yaml  

```
speller:
  algebra:
    - "erase/^xx$/"
    - derive/^([zcs])h/$1/             # zh, ch, sh => z, c, s 添加
    - derive/([ei])n$/$1ng/            # en => eng, in => ing 添加
```

1. 的任何修

1. 短短的

1. 短短的
