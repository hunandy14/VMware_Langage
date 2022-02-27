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
    $AppPath = "C:\Program Files (x86)\VMware\VMware Workstation\messages2"
    
    $File = "$dwlPath\$FileName"
    
    # 建立臨時資料夾
    if (!(Test-Path -PathType:Container $dwlPath) -or $Force) {
        # Write-Host "Create Directory:: $dwlPath"
        New-Item -ItemType:Directory -Path:$dwlPath -Force | Out-Null
    }
    # 下載檔案
    if (!(Test-Path -PathType:Leaf $File) -or $Force) {
        # Write-Host "Download:: $File"
        Start-BitsTransfer $Address $File
    }
    # 解壓縮檔案
    if (!(Test-Path -PathType:Container "$AppPath\$FileName") -or $Force) {
        # Write-Host "Expand:: $AppPath"
        Expand-Archive $File $AppPath -Force
    } # explorer $AppPath
}

Install-pkg