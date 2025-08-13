# Checks if a command exists and works
check_command() {
    local cmd="$1"
    if ! command -v "$cmd" >/dev/null 2>&1; then
        return 1  # Not installed
    fi
    # Optional: verify it actually runs without errors
    if ! "$cmd" --version >/dev/null 2>&1; then
        return 2  # Found but broken
    fi
    return 0  # Installed and working
}

if ! check_command brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install zsh
brew install starship
brew install tmux
brew install neovim
brew install eza
brew install stow

