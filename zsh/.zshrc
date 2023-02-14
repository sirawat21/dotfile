##################### COREUTILS #############
# export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
################### OHMYZSH ###############
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME=""
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=()
source $ZSH/oh-my-zsh.sh
##################### ZPLUG ###############
# CALLING
# Plugin Source: /opt/homebrew/Cellar/zplug/*/repos
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
# PLUGIN
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "tysonwolker/iterm-tab-colors", as:plugin, defer:2
zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
zplug "jimeh/zsh-peco-history", as:plugin, defer:2
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi
# LOAD
zplug load
##################### POWERLEVEL10k #########
# THEME
# POWERLEVEL9K_COLOR_SCHEME=''
# ELEMENT
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user host dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time)
# SEGMENT LEFT
POWERLEVEL9K_USER_BACKGROUND='203'
POWERLEVEL9K_USER_FOREGROUND='015'
POWERLEVEL9K_HOST_BACKGROUND='254'
POWERLEVEL9K_HOST_FOREGROUND='black'
POWERLEVEL9K_DIR_BACKGROUND='111'
POWERLEVEL9K_DIR_FOREGROUND='black'
POWERLEVEL9K_VCS_BACKGROUND='079'
POWERLEVEL9K_VCS_FOREGROUND='black'
# SEGMENT RIGHT
POWERLEVEL9K_TIME_BACKGROUND='203'
POWERLEVEL9K_TIME_FOREGROUND='015'
# POWERLEVEL9K_BATTERY_BACKGROUND='254'
# POWERLEVEL9K_BATTERY_FOREGROUND='black'
################# CACHE REMOVE ##############
rm -f ~/.zcompdump*
##################### ZPROFILE ##############
source $HOME/.zprofile