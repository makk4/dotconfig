$DOCUMENTS = [Environment]::GetFolderPath("MyDocuments")
$INSPATH = "$HOME\Dotconfig"

$contentToAdd = @"

function get-dotfiles () 
{
    if ('$($args[0])' -eq 'commit')
    {
        git --git-dir=C:/Users/amake/.dotfiles --work-tree=C:/Users/amake '$($args[0])' '$($args[1])' '$($args[2])'
    } 
    else
    {
        git --git-dir=C:/Users/amake/.dotfiles --work-tree=C:/Users/amake '$($args[0])' '$($args[1])' '$($args[2])' '$($args[3])'
    }
}

"@

Write-Host "Install Scripts"
."windows\src\install.ps1" fresh

Write-Host "cloning git repository"
."windows\src\bootstrap.ps1"

Write-Host "add aliase"
Add-Content "$DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1" $contentToAdd
"Set-Alias dotconfig '$INSPATH\dotconfig.ps1'" >> $DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1
"Set-Alias dotfiles get-dotfiles" >> $DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1
#TODO read git source and path into config file
#TODO run bootstrap
exit 0
