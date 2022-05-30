[CmdletBinding()]
Param (
    $Command,
    $arg0,
    $arg1,
    $arg2
)

function Intro
{
    Write-Host ""
    Write-Host "       __      __  _____ __         "
    Write-Host "  ____/ /___  / /_/ __(_) /__  _____"
    Write-Host " / __  / __ \/ __/ /_/ / / _ \/ ___/"
    Write-Host "/ /_/ / /_/ / /_/ __/ / /  __(__  ) "
    Write-Host "\__,_/\____/\__/_/ /_/_/\___/____/  "
    Write-Host ""
    Write-Host "Windows" -ForegroundColor Magenta
    [System.Environment]::OSVersion.Version
    Write-Host ""
}

function Help
{
    Write-Host "Usage: dot <command> <option>"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host ""
    Write-Host "help        show this screen"
    Write-Host "sync        Sync dotflies"
    Write-Host "update      Update system"
}

#  Main

if (-not ([string]::IsNullOrEmpty($Command)))
{
    if ("$($Command))" -like "up*")
    {
        Intro
        ."$HOME\Dotcofig\update.ps1"
    }
    elseif ("$($Command)" -like "sync*")
    {
        ."$HOME\Dotcofig\sync.ps1" "$($arg0)" "$($arg1)" "$($arg2)"
    }
    elseif ("$($Command)" -like "help*") {
        Intro
        Help
    }
    else
    {
        Write-Host "Unknown command: $($Command)" -ForegroundColor Red
        Write-Host ""
        Help
    }
}
else 
{
    Intro
    Help
}

exit 0