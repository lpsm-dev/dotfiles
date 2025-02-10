#!/usr/bin/env zsh

#
# ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗
# ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║
#    ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║
#    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║
#    ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
#    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
#

export ZINIT_PATH="$HOME/.zinit/bin"

if [ ! -f "$ZINIT_PATH/zinit.zsh" ]; then
    echo "Installing zinit ..."
    [ ! -d "$ZINIT_PATH" ] && mkdir -p "$ZINIT" 2> /dev/null
    if [ -x "$(which git)" ]; then
        git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_PATH
    else
        echo "ERROR: please install git before installation !!"
        exit 1
    fi
    if [ ! $? -eq 0 ]; then
        echo ""
        echo "ERROR: downloading zinit failed !!"
        exit 1
    fi;
fi

source "$ZINIT_PATH/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/fast-syntax-highlighting

# If completion is needed, de-comment lines below.
# this will add 200ms loading time.
zinit ice wait lucid atload"zicompinit"

# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
