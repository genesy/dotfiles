sudo apt-get update
sudo apt-get install neovim

# install vimplug plugin manager
curl -fLo  ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link neovim config file
ln ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln ~/dotfiles/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln ~/dotfiles/nvim/plugins.vim ~/.config/nvim/plugins.vim
ln ~/dotfiles/nvim/styles.vim ~/.config/nvim/styles.vim

# install plugins
nvim +PlugInstall +qall


mklink %LOCALAPPDATA%\nvim\init.vim %USERPROFILE%\dotfiles\nvim\init.vim
