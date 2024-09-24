# Check if oh-my-posh is installed
if (-not (Test-Path -Path $PROFILE -PathType Container)) {
    Write-Host "oh-my-posh is not installed. Installing oh-my-posh..."
    winget install JanDeDobbeleer.OhMyPosh -s winget
}

# Check if Fire Code Nerd font is installed
if (-not (Test-Path -Path "C:\Windows\Fonts\FiraCode-Regular.ttf" -PathType Leaf)) {
    Write-Host "FiraCode font is not installed. Installing FiraCode font..."
    oh-my-posh font install FiraCode
}