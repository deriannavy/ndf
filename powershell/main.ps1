
# Refresh profile
function Reload-Profile {
    #TODO: ACTUALIZAR CONSOLE
    Write-Host "Updated..." -ForegroundColor Red -NoNewline
    & powershell -NoExit -Command "Set-Location -Path $(Get-Location)"
    exit
}

Set-Alias -Name cr -Value Reload-Profile

# 1..5 | ForEach-Object { $_ * 2 }