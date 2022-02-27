function Install-pkg {
    param (
        [string] $lang,
        [switch] $Force
    )
    if (!$lang) { $lang = 'zh_CN' }
    
    # 設定參數
    $FileName    = "$lang.zip"
    $Address = "https://github.com/hunandy14/VMware_Langage/raw/master/pkg/$FileName"
    
    $dwlPath = "$env:TEMP\Install-pkg"
    $AppPath = "C:\Program Files (x86)\VMware\VMware Workstation\messages"
    
    $File = "$dwlPath\$FileName"
    
    # 建立臨時資料夾
    if (!(Test-Path -PathType:Container $dwlPath) -or $Force) {
        Write-Host "Create Directory:: $dwlPath"
        New-Item -ItemType:Directory -Path:$dwlPath -Force | Out-Null
    }
    # 下載檔案
    if (!(Test-Path -PathType:Leaf $File) -or $Force) {
        Write-Host "Download:: $File"
        Start-BitsTransfer $Address $File
    }
    # 解壓縮檔案
    $LnkPath = "$AppPath\$lang\VMware Workstation Pro.lnk"
    if (!(Test-Path -PathType:Leaf $LnkPath) -or $Force) {
        Write-Host "Expand:: $AppPath"
        Expand-Archive $File $AppPath -Force
    } # explorer $AppPath
    
    # 安裝到開始選單
    $StarMenu = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\VMware"
    $userDsk = [Environment]::GetFolderPath("Desktop")
    
    Write-Host "覆蓋開始選單捷徑..."
    Copy-Item $LnkPath $StarMenu
    Write-Host "覆蓋桌面捷徑..."
    Copy-Item $LnkPath $userDsk
    Write-Host "安裝完成::重新啟動VM即可"
} # Install-pkg
