###### [1]ENVIRONMENT ######

# ZSH SHELL CONFIG
ZDOTDIR=$HOME/.zsh

# HOME BREW
HOMEBREW=/opt/homebrew/bin
HOMEBREW_PROGRAMS=/opt/homebrew/Cellar

# NODE VERSION MANAGEMENT NVM
export NVM_DIR="$HOME/.nvm"

# JAVA HOME
export JAVA_HOME=$(ls -d $HOMEBREW_PROGRAMS/openjdk/23* | sort -V | tail -n 1)

# GLOBAL PATH
export PATH=$PATH:$HOMEBREW
