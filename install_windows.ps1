
Write-Host "Install Scripts"
."windows\src\install.ps1" fresh

Write-Host "cloning git repository"
."windows\src\bootstrap.ps1"

#TODO read git source and path into config file
#TODO run bootstrap
exit 0
