##################### ZPLUG ###############
# ZPLUG DIR
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
# PLUGIN
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug load
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi
################### OHMYZSH ###############
# OHMYZSH DIR
export ZSH=~/.oh-my-zsh
# THEME
ZSH_THEME=""
##################### ZPROFILE ##################
source $HOME/.zprofile