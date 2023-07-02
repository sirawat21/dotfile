#!/bin/zsh
DOTFILE_DIR=$(pwd)

# SET HOUSH LOGIN
echo "🔵 SET HOUSH LOGIN"
touch $HOME/.hushlogin

# INSTALL X-CODE CMD
if ! command -v xcode-select &> /dev/null; then
    echo "🔵 INSTALL X-CODE COMMAND TOOL"
    xcode-select --install
fi

# INSTALL HOMEBREW
if ! command -v brew &> /dev/null; then
    echo "🔵 INSTALLING HOMEBREW \n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# READ ENV
echo "🔵 SET .zshrc FILE \n"
source $DOTFILE_DIR/zsh/.zshenv

# INSTALL HOMEBREW PACKAGES
if command -v brew &> /dev/null; then
    echo "🔵 INSTALLING HOMEBREW PACKAGE \n"
    while IFS= read -r package || [[ -n "$package" ]]; do
        brew install $package
    done < $DOTFILE_DIR/homebrew/packages.txt
fi

# BREW INSTALL NVM
if command -v brew &> /dev/null; then
    echo "🔵 INSTALL NVM \n"
    brew cleanup nvm
    mkdir $HOME/.nvm
    export NVM_DIR=$HOME/.nvm
    brew install nvm
    source $(brew --prefix nvm)/nvm.sh

# NVM INSTALL NODE LTS
    if command -v nvm &> /dev/null; then
        echo "🔵 NVM INSTALL NODE LTS \n"
        nvm install node --lts
    fi
fi

# BREW INSTALL OTHER PACKAGES
if command -v brew &> /dev/null; then
    # BREW INSTALL TMUX
    echo "🔵 INSTALL TMUX \n"
    brew install tmux
    
    # BREW INSTALL NEO-VIM
    echo "🔵 INSTALL NEO VIM \n"
    brew install neovim 
fi

# SET CONFIG TO GIT
echo "🔵 SET GIT CONFIG \n"
cat $DOTFILE_DIR/git/.gitconfig > $HOME/.gitconfig

# CREATE TEMPLATE SSH CONFIG
echo "🔵 CREATE TEMPLATE SSH CONFIG \n"
cp -R $DOTFILE_DIR/ssh/.ssh $HOME

# CREATE TMUX CONFIG
cp -R $DOTFILE_DIR/tmux/.tmux.conf $HOME/.tmux.conf

# INSTALL STARSHIP PROMPT
echo -n "🔵 INSTALL STARSHIP PROMPT [Y/y]: "
read INPUT
if [[ "$INPUT" == "Y" || "$INPUT" == "y" ]]; then
    echo "PROCEEDING INSTALLATION \n"
    cp -R $DOTFILE_DIR/starship/ $HOME/.config/starship/
    curl -sS https://starship.rs/install.sh | sh
else
    echo "SKIPED INSTALLATION \n"
fi

# CREATE ZSH SHELL ENV
echo "🔵 SET ZSH ENV \n"
cp -R $DOTFILE_DIR/zsh/ $HOME/
source $HOME/.zshenv