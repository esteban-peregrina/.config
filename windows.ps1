# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script as administrator
    Write-Host -ForegroundColor Yellow "You must run this script as an administrator ! Press enter to restart the script as an administrator..."
    # Wait for approval
    Read-Host
    Start-Process PowerShell -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is not installed. Please ensure you have the Windows Package Manager installed to use this script."
    exit
}

# Function to reload environment variables
function Update-EnvironmentVariables {
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")
}

# Install Git
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "Visual Studio Code is already installed."
} else {
    Write-Host "Installing Git..."
    winget install -e --id Git.Git --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "Git installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "Failed to install Git."
    }
}

# Install Docker Desktop
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "Docker Desktop is already installed."
} else {
    Write-Host "Installing Docker Desktop..."
    winget install --id Docker.DockerDesktop -e --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "Docker Desktop installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "Failed to install Docker Desktop."
    }
}

# Install Visual Studio Code
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "Visual Studio Code is already installed."
} else {
    Write-Host "Installing Visual Studio Code..."
    winget install --id Microsoft.VisualStudioCode -e --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "Visual Studio Code installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "Failed to install Visual Studio Code."
    }
}

# Verify installations
Write-Host "Verifying installations..."
Write-Host "Git Version:" (git --version)
Write-Host "Docker Version:" (docker --version)
Write-Host "VS Code Version:" (code --version)

# Pause at the end to keep the window open
Write-Host "Press Enter to close the window..."
Read-Host