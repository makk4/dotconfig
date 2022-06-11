[CmdletBinding()]
Param (
    $Command,
    $arg0
)

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

#######################################################################
#                            MAIN                                     #
#######################################################################

Copy-Item -Path "windows\src\*" -Destination "$INSPATH\" -Recurse

if (-not ([string]::IsNullOrEmpty($Command)))
{
    if ("$($Command))" -like "fresh*")
    {
        Add-Content "$DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1" $contentToAdd
        "Set-Alias dotconfig '$INSPATH\dotconfig.ps1'" >> $DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1
        "Set-Alias dotfiles get-dotfiles" >> $DOCUMENTS\PowerShell\Microsoft.PowerShell_profile.ps1
    }
}

exit 0
