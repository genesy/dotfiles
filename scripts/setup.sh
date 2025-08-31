sudo add-apt-repository ppa:neovim-ppa/unstable
# Check if gcc (or cc) is already installed
if ! command -v gcc >/dev/null 2>&1 && ! command -v cc >/dev/null 2>&1; then
  echo "[INFO] No C compiler found. Installing build tools..."
  sudo apt update
  sudo apt install -y build-essential gcc g++ make clang pkg-config \
    ripgrep fd-find unzip cmake
else
  echo "[INFO] C compiler already installed. Skipping..."
fi

apt-get install stow
stow .
apt-get install zsh
apt-get install neovim
apt-get install zoxide
curl -sS https://starship.rs/install.sh | sh
apt-get install fzf

zsh
