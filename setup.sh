#!/bin/sh

# BANNER
source ./src/banner

# BREW
echo "🚛 Installing homw brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask
brew install $(cat ./src/brewfile | tr '\n' ' ')

# SHELL
echo "✏️  Create zsh profile"
cp ./src/.zprofile $HOME
cp ./src/.zshrc $HOME
echo "✏️  Change shell to zsh"
chsh -s /bin/zsh $USER
source $HOME/.zprofile

# HASH LOGIN
touch $HOME/.hashlogin

# HOST NAME
sudo scutil --set HostName BMP

# GIT
echo "✏️  Create gitconfig file"
cp ./src/.gitconfig $HOME

# TMUX
echo "  Create tmux config file"
cp ./src/.tmux.conf $HOME

# VIM
echo "✏️  Create vimrc file"
cp ./src/.vimrc $HOME

# VIM PLUG
echo "🚛 Install Vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
