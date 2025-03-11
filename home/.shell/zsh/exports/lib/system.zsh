#!/usr/bin/env zsh

#
# ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
# ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
# █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
# ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
# ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
# ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
#

# ================================================
# AWS
# ================================================
export SLS_TELEMETRY_DISABLED=1
export SLS_TRACKING_DISABLED=1

# ================================================
# BITWARDEN
# ================================================
export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
export BITWARDEN_SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

# ================================================
# GPG
# ================================================
export GPG_TTY=$(tty)

# ================================================
# HOMEBREW
# ================================================
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ANALYTICS_THIS_RUN=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1
export HOMEBREW_BREWFILE=~/Brewfile

# ================================================
# LC
# ================================================
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
