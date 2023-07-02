#!/bin/zsh
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