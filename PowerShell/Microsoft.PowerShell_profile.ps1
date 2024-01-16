###
### Install-Modules
###
Install-Module posh-git -Scope CurrentUser -Force

###
### oh-my-posh
###
oh-my-posh --init --shell pwsh --config ~/.agnosterplus-dbuckingham.omp.json | Invoke-Expression

###
### Update PATH Environment Variable
###
$Env:PATH += ";$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Scripts"
$Env:PATH += ";$([Environment]::GetFolderPath("MyDocuments"))\Scripts\Git"

###
###
###
Set-PSReadLineKeyHandler -Key Tab -Function Complete

###
### Aliases
###
Set-Alias -Name go -Value gd

###
### Command line "tab" completion for .NET Core CLI in Powershell or bash
### https://www.hanselman.com/blog/CommandLineTabCompletionForNETCoreCLIInPowerShellOrBash.aspx
###
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
      dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
      }
}

###
### groot - Quickly CD to the root of a Git repo.
###
function groot {
    Set-Location (git rev-parse --show-cdup)
    Write-Host -ForegroundColor DarkGreen "`t""I am groot.""`r`n`t-Groot, 'Guardians of the Galaxy'"
}