dir=`dirname $0`
dotfiles="$HOME/dotfiles"

ln -fsn $dotfiles/vim/.vimrc ~/.vimrc
ln -fsn $dotfiles/vim/.vimrc ~/.nvimrc
ln -fsn $dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -fsn $dotfiles/zsh/.zshrc ~/.zshrc
ln -fsn $dotfiles/zsh/gene.zsh-theme ~/.oh-my-zsh/themes/gene.zsh-theme
ln -fsn $dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -fsn $dotfiles/git/.gitignore ~/.gitignore
ln -fsn $dotfiles/git/.gitconfig ~/.gitconfig

