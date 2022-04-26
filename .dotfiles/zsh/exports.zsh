#!/usr/bin/env zsh

# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝

# NVM envs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Krew envs
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Ruby envs
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Go envs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

# System envs
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/.cargo/bin/

# Disables statistics that brew collects
export HOMEBREW_NO_ANALYTICS=1

# LC variables
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Kubernetes
export KUBE_EDITOR="vim"
