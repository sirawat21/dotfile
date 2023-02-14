################### OHMYZSH ###############
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
##################### ZPLUG ###############
# ZPLUG DIR
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
# PLUGIN
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi
# LOAD
zplug load
##################### POWERLEVEL10k #########
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
##################### ZPROFILE ##################
source $HOME/.zprofile