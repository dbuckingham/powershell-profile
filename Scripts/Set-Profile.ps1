$gitRepoPath = Join-Path -Path $PSScriptRoot -ChildPath ".."

function Setup-Symlink($path, $value)
{
  Write-Host "Setting symlink for $path..."

  $symlinkParams = @{
    Path = $path
    Value = $value
    ItemType = 'SymbolicLink'
    Force = $true
  }

  New-Item @symlinkParams | Out-Null

  Write-Host "...done."
}

#
# Setup symlink for .gitconfig
#
Setup-Symlink -path $PROFILE -value "$gitRepoPath\PowerShell\Microsoft.PowerShell_profile.ps1"

#
# Setup symlink for Agnoster Plus Windows Terminal theme.
#
Setup-Symlink -path (Join-Path -Path $HOME -ChildPath .agnosterplus-dbuckingham.omp.json) -value "$gitRepoPath\WindowsTerminal\.agnosterplus-dbuckingham.omp.json"


#
# Setup symlink for .gitconfig
#
Setup-Symlink -path (Join-Path -Path $HOME -ChildPath .gitconfig) -value "$gitRepoPath\Git\.gitconfig"