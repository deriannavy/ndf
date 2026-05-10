
# Refresh profile
function Reload-Profile {
    console 0 "Updated..."
    & pwsh -NoExit -Command "Set-Location -Path $(Get-Location)"
    exit

}

Set-Alias -Name cr -Value Reload-Profile

# PS1
function prompt {
    $TIME = (Get-Date).ToString("HH.mm")
    $PATH = (Get-Location).Path
    $PROJECTSDIR = Join-Path $HOME "Projects"
    $FOLDER = Split-Path -Leaf (Get-Location)
    $BRANCH = git branch --show-current 2>$null
    $PROJECT = ""

    Write-Host " $TIME" -NoNewline -ForegroundColor Yellow
    Write-Host " Diez " -NoNewline

    if ($PATH -like "$PROJECTSDIR*" -and (Split-Path -Leaf (Get-Location)) -ne "Projects") {
        $RELATIVE = $PATH.Substring($PROJECTSDIR.Length).TrimStart('\')
        $PROJECT = $RELATIVE.Split('\')[0]
        Write-Host "‣ [" -NoNewline
        Write-Host "$PROJECT"  -NoNewline -ForegroundColor Red
    } else {
        Write-Host "» " -NoNewline
        Write-Host "$FOLDER"  -NoNewline -ForegroundColor Red
    }

    if($BRANCH){
        Write-Host " ➜ " -NoNewline
        Write-Host " $BRANCH" -NoNewline -ForegroundColor Magenta
    }

    if($PATH -like "$PROJECTSDIR*" -and (Split-Path -Leaf (Get-Location)) -ne "Projects"){
        Write-Host "]"  -NoNewline
        if($FOLDER -ne $PROJECT) {
            Write-Host " $FOLDER"  -NoNewline
        }
    }

    return " $› "
}

# Importing Aliases
foreach ($file in @("$HOME\.ndf\powershell\alias.ps1") + (Get-ChildItem "$HOME\.ndf\powershell\functions\*")) {
    . $file
}
