if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$YesOrNo = "Ja (Y) / Nein (N): "
$YesNoSingle = "Ja (Y) / Nein (N) / Einzeln (E): "
New-Variable -Name check -Option AllScope -Value ""


function YesOrNo(){
    Write-Host $YesOrNo -ForegroundColor Green -NoNewline
    $check = Read-Host
    Write-Host ""
}

function YesNoSingle(){
    Write-Host $YesNoSingle -ForegroundColor Green -NoNewline
    $check =  Read-Host
    Write-Host ""
}

function InstallChocolatey(){
    Write-Host "Hallo, moechtest du Chocolatey installieren?" -ForegroundColor Red
    YesOrNo
    if($check -eq "Y"){
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        choco install chocolatey-core.extension
    }else{
        Break
    }
}

function CheckIfAutoInstall(){
    Write-Host ""
    Write-Host "Hallo, moechtest du eine Installation ohne Nachfragen?" -ForegroundColor Red
    YesOrNo
    if($check -eq "Y"){
        choco feature enable -n allowGlobalConfirmation
    }
}

function GetEssentialTools(){
    Write-Host ""
    Write-Host "Moechtest du alle wichtigen Tools installieren?" -ForegroundColor Red
    Write-Host "7Zip, VLC Player, Windows Terminal, Bitwarden" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install 7zip.install
        choco install vlc
        choco install microsoft-windows-terminal
        choco install bitwarden
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du 7ZIP installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install 7zip.install
            }
        Write-Host ""
        Write-Host "Moechtest du VLC installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install vlc
            }
        Write-Host ""
        Write-Host "Moechtest du das neue Windows Terminal installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install microsoft-windows-terminal
            }
        Write-Host ""
        Write-Host "Moechtest du Bitwarden installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install bitwarden
            }
    }
}

function GetDevTools(){
    Write-Host ""
    Write-Host "Moechtest du alle Entwickler Tool installieren?" -ForegroundColor Red
    Write-Host "Visual Studio 2019 Community, VSCode, JetBrains Toolbox, Github-Desktop, Postman, Docker-CLI, Power BI, MRAN, R Studio" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install visualstudio2019community
        choco install vscode
        choco install jetbrainstoolbox
        choco install github-desktop
        choco install postman
        choco install docker-cli
        choco install powerbi
        choco install microsoft-r-open
        choco install r.studio    
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du Visual Studio 2019 installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install visualstudio2019community
            }
        Write-Host ""
        Write-Host "Moechtest du Visual Studio Code installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install vscode
            }
        Write-Host ""
        Write-Host "Moechtest du JetBrains Toolbox installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install jetbrainstoolbox
            }
        Write-Host ""
        Write-Host "Moechtest du Github Desktop installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install github-desktop
            }
        Write-Host ""
        Write-Host "Moechtest du Postman installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install postman
            }
        Write-Host ""
        Write-Host "Moechtest du Docker CLI installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install docker-cli
            }
        Write-Host ""
        Write-Host "Moechtest du Power BI installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install powerbi
            }
        Write-Host ""
        Write-Host "Moechtest du MRAN installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install microsoft-r-open
            }
        Write-Host ""
        Write-Host "Moechtest du R Studio installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install r.studio
            }        
    }
}

function GetBrowser(){
    Write-Host ""
    Write-Host "Moechtest du alle Browser installieren?" -ForegroundColor Red
    Write-Host "Chromium Edge, Google Chrome, Firefox" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install microsoft-edge
        choco install googlechrome
        choco install firefox
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du Microsoft Edge installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install microsoft-edge
            }
        Write-Host ""
        Write-Host "Moechtest du Google Chrome installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install googlechrome
            }
        Write-Host ""
        Write-Host "Moechtest du Firefox installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install microsoft-edge
            }
    }
}

function GetITTools(){
    Write-Host ""
    Write-Host "Moechtest du alle IT-Tools installieren?" -ForegroundColor Red
    Write-Host "Filezilla, Wireshark, Teamviewer" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install filezilla
        choco install teamviewer
        choco install wireshark
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du Filezilla installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install filezilla
            }
        Write-Host ""
        Write-Host "Moechtest du Teamviewer installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install teamviewer
            }
        Write-Host ""
        Write-Host "Moechtest du Wireshark installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install wireshark
            }
    }
}

function GetOffice(){
    Write-Host ""
    Write-Host "Moechtest du alle Office Programme installieren?" -ForegroundColor Red
    Write-Host "Typora" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install typora
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du Typora installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install typora
            }
    }
}

function GetMessenger(){
    Write-Host ""
    Write-Host "Moechtest du alle Messenger installieren?" -ForegroundColor Red
    Write-Host "Discord, Telegram, WhatsApp" -ForegroundColor Yellow
    YesNoSingle
    if($check -eq "Y"){
        choco install discord
        choco install telegram
        choco install whatsapp
    }
    elseif($check -eq "E"){
        Write-Host ""
        Write-Host "Moechtest du Discord installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install discord
            }
        Write-Host ""
        Write-Host "Moechtest du Telegram installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install telegram
            }
        Write-Host ""
        Write-Host "Moechtest du WhatsApp installieren?" -ForegroundColor Red
        YesOrNo
        if($check -eq "Y"){
            choco install whatsapp
            }
    }
}

InstallChocolatey
CheckIfAutoInstall
GetEssentialTools
GetDevTools
GetBrowser
GetITTools
GetOffice
GetMessenger