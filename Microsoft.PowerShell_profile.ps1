Import-Module posh-git
Import-Module PSReadLine
Import-Module Terminal-Icons

$env:POSH_GIT_ENABLED = $true

Invoke-Expression (oh-my-posh --init --shell pwsh --config "C:/Users/maged/AppData/Local/Programs/oh-my-posh/themes/mythemes/myzash.omp.json")

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
