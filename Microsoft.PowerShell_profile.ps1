Invoke-Expression (& {
    $initScript = zoxide init powershell | Out-String
    $initScript = $initScript -replace 'Set-Alias -Name z -Value', 'Set-Alias -Name cd -Value'
    $initScript
})
$PSStyle.Formatting.TableHeader = $psstyle.Foreground.BrightRed
Set-PSReadLineOption -Colors @{emphasis = '#ff0000'; inlinePrediction = 'Cyan'}
$key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'

function prompt {
    $esc = [char]27
    $customPink = "$esc[38;2;255;82;241m"  # Your original pink color #ff52f1
    $reset = "$esc[0m"                     # Reset colors
    
    # Get the current path
    $currentPath = (Get-Location).Path
    
    # First convert the path, then apply color to the whole thing
    $currentPath = $currentPath -replace [regex]::Escape($env:USERPROFILE), "~"
    $currentPath = "$customPink$currentPath$reset"
    
    $gitBranch = ''
    if (Test-Path .git) {
        $gitBranch = & git rev-parse --abbrev-ref HEAD 2>$null
        if ($gitBranch) {
            $gitBranch = " ($gitBranch)"
        }
    }
    "$currentPath$gitBranch$customPink > $reset"
}

# Git aliases
function global:Add-GitFiles { git add $args }
Set-Alias -Name ga -Value Add-GitFiles -Option AllScope -Scope Global -Force

function global:Pull-GitChanges { git pull $args }
Set-Alias -Name gpl -Value Pull-GitChanges -Option AllScope -Scope Global -Force

function global:Push-GitChanges { git push $args }
Set-Alias -Name gp -Value Push-GitChanges -Option AllScope -Scope Global -Force

function global:Commit-GitChanges { git commit -m $args }
Set-Alias -Name gc -Value Commit-GitChanges -Option AllScope -Scope Global -Force

function global:Checkout-GitBranch { git checkout $args }
Set-Alias -Name gch -Value Checkout-GitBranch -Option AllScope -Scope Global -Force

function global:Reset-GitChanges { git reset $args }
Set-Alias -Name gr -Value Reset-GitChanges -Option AllScope -Scope Global -Force

function global:Show-GitLog { git log $args }
Set-Alias -Name gl -Value Show-GitLog -Option AllScope -Scope Global -Force

function global:Status-Git { git status $args }
Set-Alias -Name gs -Value Status-Git -Option AllScope -Scope Global -Force

function global:Branch-Git { git branch $args }
Set-Alias -Name gb -Value Branch-Git -Option AllScope -Scope Global -Force

function global:Merge-Git { git merge $args }
Set-Alias -Name gm -Value Merge-Git -Option AllScope -Scope Global -Force

function global:Diff-Git { git diff $args }
Set-Alias -Name gd -Value Diff-Git -Option AllScope -Scope Global -Force

function global:Fetch-Git { git fetch $args }
Set-Alias -Name gf -Value Fetch-Git -Option AllScope -Scope Global -Force

function global:Stash-Git { git stash $args }
Set-Alias -Name gst -Value Stash-Git -Option AllScope -Scope Global -Force

function global:Rebase-Git { git rebase $args }
Set-Alias -Name grb -Value Rebase-Git -Option AllScope -Scope Global -Force

# LazyGit alias
function global:Open-LazyGit { lazygit $args }
Set-Alias -Name g -Value Open-LazyGit -Option AllScope -Scope Global -Force

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

# LS alias
function global:List-Directory { ls $args }
Set-Alias -Name l -Value List-Directory -Option AllScope -Scope Global -Force

