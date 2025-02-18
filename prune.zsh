#!/bin/zsh

# REMOVE HOMEBREW
if command -v brew &> /dev/null; then
    # REMOVE NVM
    brew cleanup nvm
    # UNINSTALL ALL PACKAGES
    echo "🔴 REMOVE HOMEBREW PACKAGES \n"
    brew uninstall --force --ignore-dependencies $(brew list)
    # UNINSTALL HOMEBREW
    yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    echo "🔴 REMOVE HOMEBREW DIRECTORY \n"
    sudo rm -rf /opt/homebrew/
fi

# REMOVE HOUSH LOGIN
echo "🔴 REMOVE HOUSH LOGIN \n"
rm -f $HOME/.hushlogin

# REMOVE NVM CONFIG
echo "🔴 REMOVE NVM CONFIG \n"
rm -rf $HOME/.nvm
rm -rf $HOME/.npm

# REMOVE GIT CONFIG
echo "🔴 REMOVE GIT CONFIG \n"
rm -f $HOME/.gitconfig


# # REMOVE SSH CONFIG
echo "🔴 REMOVE TEMPLATE SSH CONFIG \n"
rm -rf $HOME/.ssh/

# REMOVE TMUX CONFIG
rm -f $HOME/.tmux.conf

# # REMOVE ZSHRC
echo "🔴 REMOVE ZSH SHELL ENV \n"
rm -f $HOME/.zshenv 
rm -f $HOME/.zsh_history
rm -rf $HOME/.zsh/

# # REMOVE RUBY CONFIG
# rm -rf $HOME/.rbenv
# rm -rf $HOME/.ruby-version