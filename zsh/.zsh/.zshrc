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
    PROMPT='%n@%m:%1d$ '
else
    ## STARSHIP
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    export STARSHIP_CACHE=$HOME/.config/starship/cache
    eval "$(starship init zsh)"
fi

#COREUTILS
# export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"