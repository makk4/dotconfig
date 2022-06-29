Write-Host "Update pip Plugins..." -ForegroundColor Cyan
python -m pip install --user --upgrade pip

Write-Host "Update Powershell Modules..." -ForegroundColor Cyan
Update-Module
Get-Module

Write-Host "Update Windows Apps..." -ForegroundColor Cyan
winget upgrade --all

Write-Host "Update WSL Kernel..." -ForegroundColor Cyan
wsl --update
wsl --shutdown

Write-Host "Update DotConfig..." -ForegroundColor Cyan
Set-Location $HOME\dotconfig\
git pull

Write-Host "Refresh powershell..." -ForegroundColor Cyan
refreshenv

Write-Host  "Completed" -ForegroundColor Cyan
Read-Host -Prompt "Press Enter to exit"
