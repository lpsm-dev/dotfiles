#!/usr/bin/env zsh

#
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#

# Shortcuts
alias c="clear"
alias cls="clear"
alias tree="tree -C"
alias ls="ls --color"
alias -- +x="chmod +x"
alias cpu="top -o cpu"
alias mem="top -o rsize"
alias now="date +'%Y-%m-%d %T'"
alias week='date +%V'
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
alias g="git"
alias gs="g status"
alias gpull="g pull"
alias gpush="g push"

# General
alias reload-bat="bat cache --build"

# Brew
alias brewd="brew doctor"
alias brewi="brew install"
alias brewr="brew uninstall"
alias brews="brew search"
alias brewu="brew update --quiet \
                && brew upgrade \
                && brew cleanup"

# Simple WTF
alias wtf="cowsay 'wtf bro, go back to work!'"

# Setup eza as default ls
if [ -x "$(command -v eza)" ]; then
  alias ld="eza -lD"
  alias lf="eza -lf --color=always"
  alias lh="eza -dl .* --group-directories-first"
  alias ll="eza -al --group-directories-first"
  alias ls="eza -al --color=always"
  alias lt="eza -al --sort=modified"
else
  alias ls="ls -AlhF --color=auto"
fi

# Exit terminal
alias x="exit"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

# Fetch system information
alias neo="neofetch"
alias ff="fastfetch"

# Empty the trash, the main HDD and on all mounted volumes,
alias empty-trash="sudo rm -frv /Volumes/*/.Trashes; \
                    sudo rm -frv ~/.Trash; \
                    sudo rm -frv /private/var/log/asl/*.asl; \
                    sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Update applications and CLTs
alias u="sudo softwareupdate --install --all \
            && brew update \
            && brew upgrade \
            && brew cleanup"
