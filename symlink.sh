dir=`dirname $0`
dotfiles="$HOME/dotfiles"

ln -fs $dotfiles/vim/.vimrc ~/.vimrc
ln -fs $dotfiles/vim/.vimrc ~/.nvimrc
ln -fs $dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -fs $dotfiles/zsh/.zshrc ~/.zshrc
ln -fs $dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -fs $dotfiles/git/.gitignore ~/.gitignore
ln -fs $dotfiles/git/.gitconfig ~/.gitconfig

