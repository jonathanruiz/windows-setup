# Ensure the profile path exists
if (-not (Test-Path -Path $PROFILE -PathType Leaf)) {
    Write-Host "Profile path does not exist. Creating profile file..."
    New-Item -Path $PROFILE -ItemType File -Force
} else {
    Write-Host "Profile path already exists."
}

# Check if oh-my-posh is installed
if (-not (Test-Path -Path $PROFILE -PathType Container)) {
    Write-Host "oh-my-posh is not installed. Installing oh-my-posh..."
    winget install JanDeDobbeleer.OhMyPosh -s winget
} else {
    Write-Host "oh-my-posh is already installed."
}

# Refresh the environment variables, specifically the PATH variable
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

# Source the profile
Write-Host "Sourcing the profile..."
. $PROFILE

# Check if Fire Code Nerd font is installed
if (-not (Test-Path -Path "C:\Windows\Fonts\FiraCodeNerdFont-Regular.ttf" -PathType Leaf)) {
    Write-Host "FiraCode font is not installed. Installing FiraCode font..."
    oh-my-posh font install FiraCode
} else {
    Write-Host "FiraCode font is already installed."
}