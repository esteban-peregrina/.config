# Tap for additional packages if necessary
tap "homebrew/cask"           # Required for macOS cask apps like Docker and VS Code
tap "homebrew/cask-versions"   # For alternative versions of some applications

# Install Git
brew "git"

# Install Docker Desktop (cask for GUI applications)
cask "docker"

# Install Visual Studio Code
cask "visual-studio-code"

#Use "brew bundle --file=macos.rb" once brew is installed