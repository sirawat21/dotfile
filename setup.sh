#!/bin/sh

# CHOOSE PLATFORM
selectPlatform() {
    read -p "Select number to choose OS [ (1) OSX | (2) Ubuntu ] : " CHOICE_SELETE_PLATFORM
    if [ "$CHOICE_SELETE_PLATFORM" -eq "1" ]; then
        # MAC
        read -p "Install Brew [y/n] : " BREW_INSTALL
        if [ "$BREW_INSTALL" == "Y" ] || [ "$BREW_INSTALL" == "y" ]; then
            echo "🚛 Installing Homebrew"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        brew cask
        brew install $(cat ./src/brewfile | tr '\n' ' ')
    elif [ "$CHOICE_SELETE_PLATFORM" -eq "2" ]; then
        # Ubuntu
        sudo apt-get update -y
        sudo apt-get install -yf $(cat ./src/aptlists | tr '\n' ' ')
    else 
        echo "Fail to process script had stop"
    fi
}
selectPlatform

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
sudo scutil --set HostName BMP

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
# NEOVIM PLUG
echo "🚚 Install Neo Vim plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "📦 Create Neo Vim config file"
cp -r ./src/nvim $HOME/.config
