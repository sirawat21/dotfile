#!/bin/sh

# INSTALL HOME BREW & PACKAGES
# echo "🚛 Installing Homebrew"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "🚛 Homebrew Packages"
BREW_PACKAGES=$(cat ./src/brewfile | tr '\n' ' ')
brew install $BREW_PACKAGES
# SHELL
echo "✏️  Create zsh profile"
cp ./src/.zprofile $HOME
cp ./src/.zshrc $HOME
echo "✏️  Change shell to zsh"
chsh -s /bin/zsh $USER
source $HOME/.zprofile

# HUSH LOGIN
touch $HOME/.hushlogin

# HOST NAME
sudo scutil --set HostName MBPRO

# GIT
echo "✏️  Create gitconfig file"
cp ./src/.gitconfig $HOME

# TMUX
echo " Create tmux config file"
cp ./src/.tmux.conf $HOME

# VIM
echo "✏️  Create vimrc file"
cp ./src/.vimrc $HOME

# VIM PLUG
echo "🚛 Install Vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# # INSTALL NVIM
# echo "🚛 Install NeoVim"
# brew install neovim
# brew link neovim
# # NEOVIM PLUG
# echo "🚚 Install Neo Vim plug"
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# echo "📦 Create Neo Vim config file"
# cp -r ./src/nvim $HOME/.config