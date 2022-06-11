
Write-Host "Install Scripts"
."windows\src\install.ps1" fresh

Write-Host "cloning git repository"
."windows\src\bootstrap.ps1"

exit 0
