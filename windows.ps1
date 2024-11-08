# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script as administrator
    Write-Host "Restarting script as administrator..."
    Start-Process PowerShell -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is not installed. Please ensure you have the Windows Package Manager installed to use this script."
    exit
} else {
    Write-Host "Winget is installed. Checking for updates..."
    winget upgrade --id Microsoft.DesktopAppInstaller -e --source winget
}

# Install Git
Write-Host "Installing Git..."
winget install -e --id Git.Git --source winget
if ($?) {
    Write-Host "Git installed successfully."
} else {
    Write-Host "Failed to install Git."
}

# Install Docker Desktop
Write-Host "Installing Docker Desktop..."
winget install --id Docker.DockerDesktop -e --source winget
if ($?) {
    Write-Host "Docker Desktop installed successfully."
} else {
    Write-Host "Failed to install Docker Desktop."
}

# Install Visual Studio Code
Write-Host "Installing Visual Studio Code..."
winget install --id Microsoft.VisualStudioCode -e --source winget
if ($?) {
    Write-Host "VS Code installed successfully."
} else {
    Write-Host "Failed to install VS Code."
}

# Verify installations
Write-Host "Verifying installations..."
Write-Host "Git Version:" (git --version)
Write-Host "Docker Version:" (docker --version)
Write-Host "VS Code Version:" (code --version)