# Import-Module Terminal-Icons

oh-my-posh init pwsh --config "C:/Users/maged/AppData/Local/Programs/oh-my-posh/themes/mythemes/myzash.omp.json" | Invoke-Expression

$env:POSH_GIT_ENABLED = $true

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
