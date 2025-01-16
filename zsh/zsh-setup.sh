sudo apt-get update
sudo apt-get install zsh

# remove default zshrc then link dotfiles version
ln ~/dotfiles/zsh/gene.zsh-theme ~/.oh-my-zsh/themes/gene.zsh-theme
rm ~/.zshrc
ln ~/dotfiles/zsh/.zshrc ~/.zshrc
