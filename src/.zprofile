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

#RM
export rmm() { rm -rf $1 }

#CHANGE & CREATE DIRECTORY
export mkcd() {mkdir $1 && cd -P $1}

#SET GREP
alias grep='grep'
export GREP_OPTIONS='--color=always' export GREP_COLOR='1;31;1'

# ENABLE CMD SUBSTITUTION
setopt prompt_subst

#SET GIT BRANCH
gitBranchWatch() {
    BRANCH=$(git branch 2> /dev/null |  sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
    if [ "$BRANCH" = "" ]; then
        echo "$ "
    else
        echo "%F{red}$BRANCH%f $ "
    fi
}

#SET TERM STYLE
#PROMPT='%F{green}%n%f@%F{green}%m%f:%F{yellow}%1d%f$ '
PROMPT='%F{green}%n%f@%F{green}%m%f:%F{yellow}%1d%f$(gitBranchWatch)'

#SET PYTHON
alias python='python2'
alias pip2='pip'

#SET PHP
alias php='/usr/local/bin/php'

#SET VIM
alias vim='/usr/local/bin/nvim'
alias vi='/usr/local/bin/vim'
alias vims='vim -S session.vim'

#SET CAT HIGH LIGHT
alias cat='ccat'
#QUICK CAST
alias inet='ifconfig | grep "inet\|ether"'
export psshow() { launchctl list | grep $1 }
# TMUX
alias tx='tmux'
export txs() { tmux new -s $1}

#GATEKEEPER disable/enable
# sudo spctl --master-disable
