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
if [[ -f $(which nvim) ]]; then
  export VISUAL="vi"
  export EDITOR="$VISUAL"
  alias vi="nvim"
fi
alias brc="nvim ~/.bashrc"
alias zrc="nvim ~/.zshrc"
alias nv="nvim"

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

# Docker + Docker Compose
alias d="docker $*"
alias dc="docker-compose $*"

if [[ -x $(which docker) ]]; then
  alias kali="docker run --rm -ti kalilinux/kali bash"
  alias ubuntu="docker run --rm -ti ubuntu:latest bash"
  alias debian="docker run --rm -ti debian:latest bash"
  alias centos="docker run --rm -ti centos:latest bash"
  alias archlinux="docker run --rm -ti archlinux:latest bash"
fi

# Tools
alias pip="pip3"
# alias python="python3"
alias neo="neofetch"

# Golang
alias grun="go run"
alias gtidy="go mod tidy"

# Kubectl
alias k="kubectl"
alias kview="k config view"
alias kctx="k config current-context"
alias kns="k get ns"

# Helm
alias h="helm"

# VSCodium
alias codium="codium"

# Others
alias wtf="cowsay 'wtf bro, go back to work!'"
if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias la="exa --long --all --group"
fi
