VMware 中文漢化懶人包
===

## 快速執行
先按下 Win+X 然後再按下 A ➔ 打開終端機，然後輸入以下的代碼
```
irm raw.githubusercontent.com/hunandy14/VMware_Langage/master/VMware_Langage.ps1|iex; Install-pkg
```

執行完再重啟VM就會以簡體中文啟動了

<br>

### 懶人包執行的內容
1. 下載中文包自動解壓到預設VM資料夾內 (簡中語言包在pkg裡)
2. 修改桌面跟開始內的捷徑，追加 `--locale zh_CN` 參數


<br><br><br>

## 手動漢化方法
1. 安裝中文語言包，位置在 `"C:\Program Files (x86)\VMware\VMware Workstation\messages"`
2. 漢化的方法是在執行檔的捷徑結尾追加語言參數 `--locale zh_CN` ，這樣就會以中文語言啟動了。

```ps1
"C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe" --locale zh_CN
```

> VM本身有提供簡體中文版，不過要在簡體環境下安裝的時候才會解出來  
> 源檔是從VM16上挖出來的官方中文包，測試使用在VM17上目前是沒問題  