#!/usr/bin/env zsh

#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# Navigation
alias -- -="cd -"
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."

# Shortcuts
alias c="clear"
alias cls="clear"
alias cc="code ."
alias tree="tree -C"
alias ls="ls --color"
alias -- +x="chmod +x"
alias cpu="top -o cpu"
alias mem="top -o rsize"
alias now="date +'%Y-%m-%d %T'"
alias grep="grep --color"

# Nvim
alias brc="nvim ~/.bashrc"  
alias zrc="nvim ~/.zshrc" 
alias nv="nvim"

# Tools
alias pip="pip3"
alias python="python3"
alias k="kubectl"
alias h="helm"

# Git
alias gs="git status"

# Brew
alias br="brew"
alias bri="brew install"
alias brup="brew update && brew cleanup"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

# Docker
alias d="docker $*"
alias dc="docker-compose $*"

if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias la="exa --long --all --group"
fi
