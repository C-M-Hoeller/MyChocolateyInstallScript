if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Output "Hallo, möchtest du Chocolatey installieren?"
$check = Read-Host "Ja (Y) / Nein (N) "

if($check -eq "Y"){
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension
}else{
    Break
}

# wichtige Tools
Write-Output "Möchtest du alle wichtigen Tool installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
if($check -eq "Y"){
    choco install 7zip.install
    choco install vlc
    choco install microsoft-windows-terminal
    choco install bitwarden
}
elseif($check -eq "E"){
    Write-Output "Möchtest du 7ZIP installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install 7zip.install
        }
    Write-Output "Möchtest du VLC installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install vlc
        }
    Write-Output "Möchtest du das neue Windows Terminal installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install microsoft-windows-terminal
        }
    Write-Output "Möchtest du Bitwarden installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install bitwarden
        }
}
# Entwickler-Tools
Write-Output "Möchtest du alle Entwickler Tool installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
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
    Write-Output "Möchtest du Visual Studio 2019 installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install visualstudio2019community
        }
    Write-Output "Möchtest du Visual Studio Code installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install vscode
        }
    Write-Output "Möchtest du JetBrains Toolbox installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install jetbrainstoolbox
        }
    Write-Output "Möchtest du Github Desktop installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install github-desktop
        }
    Write-Output "Möchtest du Postman installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install postman
        }
    Write-Output "Möchtest du Docker CLI installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install docker-cli
        }
    Write-Output "Möchtest du Power BI installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install powerbi
        }
    Write-Output "Möchtest du MRAN installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install microsoft-r-open
        }
    Write-Output "Möchtest du R Studio installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install r.studio
        }        
}


# Browser
Write-Output "Möchtest du alle Browser installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
if($check -eq "Y"){
    choco install microsoft-edge
    choco install googlechrome
    choco install firefox
}
elseif($check -eq "E"){
    Write-Output "Möchtest du Microsoft Edge installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install microsoft-edge
        }
    Write-Output "Möchtest du Google Chrome installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install googlechrome
        }
    Write-Output "Möchtest du Firefox installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install microsoft-edge
        }
}

# IT-Tools
Write-Output "Möchtest du alle IT-Tools installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
if($check -eq "Y"){
    choco install filezilla
    choco install teamviewer
    choco install wireshark
}
elseif($check -eq "E"){
    Write-Output "Möchtest du Filezilla installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install filezilla
        }
    Write-Output "Möchtest du Teamviewer installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install teamviewer
        }
    Write-Output "Möchtest du Wireshark installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install wireshark
        }
}

# Documente
Write-Output "Möchtest du alle Office Programme installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
if($check -eq "Y"){
    choco install typora
}
elseif($check -eq "E"){
    Write-Output "Möchtest du Typora installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install typora
        }
}

# Messenger
Write-Output "Möchtest du alle Messenger installieren?"
$check = Read-Host "Ja (Y) / Nein (N) / Einzeln (E)"
if($check -eq "Y"){
    choco install discord
    choco install telegram
    choco install whatsapp
}
elseif($check -eq "E"){
    Write-Output "Möchtest du Discord installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install discord
        }
    Write-Output "Möchtest du Telegram installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install telegram
        }
    Write-Output "Möchtest du WhatsApp installieren?"
    $check = Read-Host "Ja (Y) / Nein (N)"
    if($check -eq "Y"){
        choco install whatsapp
        }
}