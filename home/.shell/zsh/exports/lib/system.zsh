#!/usr/bin/env zsh

#
# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
#

# Homebrew variables
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1
export HOMEBREW_BREWFILE=~/Brewfile

# LC variables
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# GPG variables
export GPG_TTY=$(tty)

# Bitwarden SSH
export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
export BITWARDEN_SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
