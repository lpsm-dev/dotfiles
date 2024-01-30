#!/usr/bin/env zsh

# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝

# ASDF
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

# Java variables
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Node variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go variables
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Ruby envs
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Krew variables
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Homebrew variables
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1

# LC variables
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Kubernetes variables
export KUBE_EDITOR="nano"

# GPG variables
export GPG_TTY=$(tty)

# OpenSSH variables
export PATH=$(brew --prefix openssh)/bin:$PATH
