###### [3] USER INTERACTIVE SHELL ######

# CALL NVM
source $(brew --prefix nvm)/nvm.sh

# APPLY PROMPT
if ! command -v starship &> /dev/null; then
    ## DEFAULT
    # COLOURING ls
    LSCOLORS=ExFxBxDxCxegedabagacad
    # COLOURING grep
    export GREP_OPTIONS='--color=always'
    export GREP_COLOR='1;31;1'
    # PROMPT FORMAT Eg: username@hostname:workingDir$ <shell>
    PROMPT="%n@%m:$ "
else
    ## STARSHIP
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    export STARSHIP_CACHE=$HOME/.config/starship/cache
    eval "$(starship init zsh)"
fi

#COREUTILS
# export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# CALL RUBY ENV MANAGER
eval "$(rbenv init - zsh)"

# COCOPAD CONFIG
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# CONFIG ANDROID ENV
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools