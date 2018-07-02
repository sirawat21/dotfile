#SET QUICK PATH
BREW_PATH='/usr/local/Cellar'

#SET ALIAS KEY ls
alias ls='ls -G'
alias la='ls -aG'
alias ll='ls -lG'
alias lla='ls -laG'
alias lal='ls -laG'
export CLICOLOR=1
export LSCOLORS=ExGxxxxxcxbxxxxxxxExEc

#SET GREP
alias grep='grep'
export GREP_OPTIONS='--color=always' export GREP_COLOR='1;31;1'

#SET TERM STYLE
PROMPT='%F{green}%n%f@%F{green}%m%f:%F{yellow}%1d%f$ '

#SET PYTHON
alias python='python2'
alias pip2='pip'

#SET PHP
alias php='/usr/local/bin/php'

#SET VIM
alias vim='/usr/local/bin/vim'
alias vi='/usr/local/bin/vim'

#SET CAT HIGH LIGHT
alias cat='ccat'
#QUICK CAST
alias inet='ifconfig | grep "inet\|ether"'
export psshow() { launchctl list | grep $1 }


#GATEKEEPER disable/enable
# sudo spctl --master-disable
