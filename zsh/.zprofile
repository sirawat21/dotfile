##################### VARIABLE ##################
# ls colour
# export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS="$(vivid generate molokai)"
# grep colour
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;31;1'
##################### PATH ######################
# HOME BREW
HOME_BREW=/opt/homebrew/bin
# GLOBAL PATH
export PATH=$PATH:$HOME_BREW
##################### PROMPT ####################
# Eg: username@hostname:workingDir$ <shell>
PROMPT='%n@%m:%1d$ '
##################### ALIAS #####################
# Zsh
alias zsh="$HOME_BREW/zsh"
# Git
alias git="$HOME_BREW/git"
# Python3
alias python="$HOME_BREW/python3"
alias pip="$HOME_BREW/pip3"
# Neo Vim
alias vim="$HOME_BREW/nvim"
# Command ls
alias ls='ls -G'
alias la='ls -aG'
alias ll='ls -lG'
alias lla='ls -laG'
alias lal='ls -laG'