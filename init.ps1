# Ensure the profile path exists
if (-not (Test-Path -Path $PROFILE -PathType Leaf)) {
    Write-Host "Profile path does not exist. Creating profile file..."
    New-Item -Path $PROFILE -ItemType File -Force
} else {
    Write-Host "Profile path already exists."
}

# Add oh-my-posh to the profile
if ((Get-Content -Path $PROFILE) -notcontains "oh-my-posh init pwsh | Invoke-Expression") {
    Write-Host "Adding oh-my-posh to the profile..."
    Add-Content -Path $PROFILE -Value "oh-my-posh init pwsh | Invoke-Expression"
} else {
    Write-Host "oh-my-posh is already added to the profile."
}

# Check if oh-my-posh is installed
if (-not (Test-Path -Path $env:LocalAppData\Programs\oh-my-posh -PathType Container)) {
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

# Set Fira Code as the default font for Windows Terminal
Write-Host "Setting FiraCode as the default font for Windows Terminal..."

$windowsTerminalSettingsPath =  "$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$settings = Get-Content -Path $windowsTerminalSettingsPath -Raw | ConvertFrom-Json

if (-not $settings.profiles.defaults.font) {
    $settings.profiles.defaults | Add-Member -MemberType NoteProperty -Name font -Value @{}
}

if (-not $settings.profiles.defaults.font.face) {
    $settings.profiles.defaults.font | Add-Member -MemberType NoteProperty -Name face -Value ""
}

if ($settings.profiles.defaults.font.face -ne "FiraCode Nerd Font") {
    $settings.profiles.defaults.font.face = "FiraCode Nerd Font"
}

$settings | ConvertTo-Json -Depth 32 | Set-Content -Path $windowsTerminalSettingsPath
