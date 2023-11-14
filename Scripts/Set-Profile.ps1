$gitRepoPath = Join-Path -Path $PSScriptRoot -ChildPath ".."

#
# Setup symlink for Agnoster Plus Windows Terminal theme.
#
$path = (Join-Path -Path $HOME -ChildPath .agnosterplus-dbuckingham.omp.json)

Write-Host "Setting symlink for $path..."
$symlinkParams = @{
  Path = $path
  Value = "$gitRepoPath/WindowsTerminal/.agnosterplus-dbuckingham.omp.json"
  ItemType = 'SymbolicLink'
  Force = $true
}
New-Item @symlinkParams | Out-Null
Write-Host "...done."