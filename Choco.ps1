if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Choco Packages
$EssentialPackages = @("7zip.install", "vlc", "microsoft-windows-terminal", "powertoys", "bitwarden", 
            "nextcloud-client", "sharpkeys", "sharex", "divvy", "ueli")
$DevelopmentPackages = @("visualstudio2019community", "vscode", "jetbrainstoolbox", "github-desktop",
            "postman", "docker-cli", "powerbi", "microsoft-r-open", "r.studio", "git-fork", "dotnetcore-sdk")
$BrowserPackages = @("microsoft-edge", "googlechrome", "firefox")
$ITToolPackages = @("filezilla", "teamviewer", "wireshark", "ccleaner")
$OfficePackages = @("typora", "office365homepremium", "pandoc")
$MessengerPackages = @("discord", "telegram", "whatsapp")

# Strings
$chooseYesOrNo = "Yes (Y) / No (N): "
$chooseYesNoIndividually = "Yes (Y) / No (N) / Individually (I): "

# Check if installed
$isChocoInstalled = powershell choco -v

# Global
$global:check

function chooseYesOrNo(){
    Write-Host $chooseYesOrNo -ForegroundColor Green -NoNewline
    $global:check = Read-Host
    Write-Host ""
}

function chooseYesNoIndividually(){
    Write-Host $chooseYesNoIndividually -ForegroundColor Green -NoNewline
    $global:check =  Read-Host
    Write-Host ""
}

function installChocolatey(){
    if(-not($isChocoInstalled)){
        Write-Output "Seems Chocolatey is not installed, do you want to install it now?" -ForegroundColor Red
        chooseYesOrNo
        if($global:check -eq "Y"){
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
            choco install chocolatey-core.extension
        }else{
            Break
        }
    }
    else{
        Write-Output "Chocolatey Version $isChocoInstalled is already installed"
    }
}

function checkIfAutoInstall(){
    Write-Host ""
    Write-Host "Do you want a silent installation?" -ForegroundColor Red
    chooseYesOrNo
    if($global:check -eq "Y"){
        choco feature enable -n allowGlobalConfirmation
    }
}

function getChocoPackage($name, $package){
    Write-Host ""
    Write-Host "Do you want to install the following $name ?" -ForegroundColor Red
    $PackageList = $package -join ', '
    Write-Host "$PackageList" -ForegroundColor Yellow
    
    chooseYesNoIndividually
    while (($global:check.ToUpper() -ne "Y") -AND ($global:check.ToUpper() -ne "N") -AND ($global:check.ToUpper() -ne "I")) {
        Write-Host "Please choose (Y) / (N) / (I)"
        chooseYesNoIndividually
    }
    if($global:check.ToUpper() -eq "Y"){
        foreach($p in $package){
            choco install $p
        } 
    }
    elseif($global:check.ToUpper() -eq "I"){
        foreach($p in $package){
            Write-Host ""
            Write-Host "Do you want to install $p ?" -ForegroundColor Red

            chooseYesOrNo
            while (($global:check.ToUpper() -ne "Y") -AND ($global:check.ToUpper() -ne "N")) {
                Write-Host "Please choose (Y) / (N)"
                chooseYesOrNo
            }

            if($global:check.ToUpper() -eq "Y"){
                choco install $p
            }
            else {
                continue
            }
        }
    }
    else{
        continue
    }
}

installChocolatey
checkIfAutoInstall

getChocoPackage "Essential Tools" $EssentialPackages
getChocoPackage "Development Tools" $DevelopmentPackages
getChocoPackage "Browsers" $BrowserPackages
getChocoPackage "IT-Tools" $ITToolPackages
getChocoPackage "Office-Tools" $OfficePackages
getChocoPackage "Messengers" $MessengerPackages