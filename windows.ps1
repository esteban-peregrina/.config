# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script as administrator
    Write-Host -ForegroundColor Yellow "[Script Info] You must run this script as an administrator ! Press enter to restart the script as an administrator..."
    # Wait for approval
    Read-Host
    Start-Process PowerShell -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Check if winget is available
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "[Script Info] Winget is not installed. Please ensure you have the Windows Package Manager installed to use this script."
    exit
}

# Function to reload environment variables
function Update-EnvironmentVariables {
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")
}

# Install Git
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "[Script Info] Visual Studio Code is already installed."
} else {
    Write-Host "[Script Info] Installing Git..."
    winget install -e --id Git.Git --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "[Script Info] Git installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "[Script Info] Failed to install Git."
    }
}

# Install Docker Desktop
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "[Script Info] Docker Desktop is already installed."
} else {
    Write-Host "[Script Info] Installing Docker Desktop..."
    winget install --id Docker.DockerDesktop -e --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "[Script Info] Docker Desktop installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "[Script Info] Failed to install Docker Desktop."
    }
}

# Install Visual Studio Code
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host -ForegroundColor Yellow "[Script Info] Visual Studio Code is already installed."
} else {
    Write-Host "[Script Info] Installing Visual Studio Code..."
    winget install --id Microsoft.VisualStudioCode -e --source winget
    
    # Check if the installation was successful
    if ($?) {
        Write-Host -ForegroundColor Green "[Script Info] Visual Studio Code installed successfully."
        Update-EnvironmentVariables  # Reload environment variables
    } else {
        Write-Error "[Script Info] Failed to install Visual Studio Code."
    }
}

# Verify installations
Write-Host "[Script Info] Verifying installations..."
Write-Host "[Script Info] Git Version:" (git --version)
Write-Host "[Script Info] Docker Version:" (docker --version)
Write-Host "[Script Info] VS Code Version:" (code --version)

# Pause at the end to keep the window open
Write-Host "Press Enter to close the window..."
Read-Host