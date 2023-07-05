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
    #SET GIT BRANCH
    gitBranch() {
        BRANCH=$(git branch 2> /dev/null |  sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
        if [ "$BRANCH" = "" ]; then
            echo "$ "
        else
            echo "%F{red}$BRANCH%f $ "
        fi
    }
    # PROMPT FORMAT Eg: username@hostname:workingDir$ <shell>
    PROMPT="%n@%m:%1d $(gitBranch) $ "
else
    ## STARSHIP
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    export STARSHIP_CACHE=$HOME/.config/starship/cache
    eval "$(starship init zsh)"
fi

#COREUTILS
# export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
