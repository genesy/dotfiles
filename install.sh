#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()    { echo -e "${BLUE}[INFO]${NC}    $1"; }
success() { echo -e "${GREEN}[OK]${NC}      $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}    $1"; }
error()   { echo -e "${RED}[ERROR]${NC}   $1"; exit 1; }

# ── Helpers ───────────────────────────────────────────────────────────────────
# Create a symlink, backing up any existing non-symlink file
link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        warn "Backing up $dst → $dst.bak"
        mv "$dst" "$dst.bak"
    fi
    ln -sf "$src" "$dst"
    success "Linked: $dst → $src"
}

# ── Homebrew ──────────────────────────────────────────────────────────────────
install_homebrew() {
    if ! command -v brew &>/dev/null; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Add brew to PATH (Apple Silicon / Linux)
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi

    success "Homebrew ready"
}

# ── Packages ──────────────────────────────────────────────────────────────────
install_packages() {
    info "Installing packages via Homebrew..."
    brew install \
        zsh \
        starship \
        tmux \
        neovim \
        eza \
        fzf \
        zoxide \
        git \
        lazygit
    success "Packages installed"
}

# ── Symlinks ──────────────────────────────────────────────────────────────────
create_symlinks() {
    info "Creating symlinks..."

    # Zsh
    link "$DOTFILES/.zshrc"   "$HOME/.zshrc"
    link "$DOTFILES/.zshenv"  "$HOME/.zshenv"

    # Tmux
    link "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

    # Claude
    link "$DOTFILES/.claude/settings.json"          "$HOME/.claude/settings.json"
    link "$DOTFILES/.claude/statusline-command.sh"  "$HOME/.claude/statusline-command.sh"

    # Neovim
    link "$DOTFILES/.config/nvim" "$HOME/.config/nvim"

    # Starship
    link "$DOTFILES/.config/starship.toml" "$HOME/.config/starship.toml"
}

# ── TPM (Tmux Plugin Manager) ─────────────────────────────────────────────────
install_tpm() {
    local tpm_dir="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$tpm_dir" ]; then
        info "Installing TPM..."
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
        success "TPM installed — press <prefix>+I inside tmux to install plugins"
    else
        success "TPM already installed"
    fi
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    echo ""
    echo "  Dotfiles Setup"
    echo "  ──────────────"
    echo ""

    install_homebrew
    install_packages
    create_symlinks
    install_tpm

    echo ""
    success "All done! Restart your shell or run: source ~/.zshrc"
    echo ""
}

main "$@"
