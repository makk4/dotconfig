param (
    [String]$Command="",
    $arg0,
    $arg1,
    $arg2
)

if (-not ([string]::IsNullOrEmpty($Command)))
{
    if ("$($Command)" -like "pull*")
    {
        Write-Host "Pull config..." -ForegroundColor Cyan
        git.exe --git-dir=$HOME/.dotfiles --work-tree=$HOME fetch
        git.exe --git-dir=$HOME/.dotfiles --work-tree=$HOME merge
    }
    elseif ("$($Command)" -like "push*")
    {
        Write-Host "Push config..." -ForegroundColor Cyan
        git.exe --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -am "sync"
        git.exe --git-dir=$HOME/.dotfiles --work-tree=$HOME push
    }
    else
    {
        Write-Host "$($arg0) $($arg1) $($arg2)"
        git.exe --git-dir=$HOME/.dotfiles --work-tree=$HOME "$($Command)" "$($arg0)" "$($arg1)" "$($arg2)"
    }
}
