#!/usr/bin/env zsh

#
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#

# ================================================
# GENERAL
# ================================================
alias reload-bat="bat cache --build"
alias wtf="cowsay 'wtf bro, go back to work!'"

# ================================================
# SHORTCUTS
# ================================================
alias -- +x="chmod +x"
alias _="ai_assistant"
alias a="aichat"
alias b="bat --style=grid,header-filename,numbers,snip"
alias c="clear"
alias cls="clear"
alias tree="tree -C"
alias ls="ls --color"
alias cpu="top -o cpu"
alias mem="top -o rsize"
alias now="date +'%Y-%m-%d %T'"
alias week='date +%V'
alias grep="grep --color"
alias x="exit"
alias reload="exec ${SHELL} -l"
alias path="echo -e ${PATH//:/\\n}"
alias neo="neofetch"
alias ff="fastfetch"
alias w="which -a"
alias history="fc -El 1"

# ================================================
# NVIM
# ================================================
if [[ -f $(which nvim) ]]; then
  export VISUAL="vi"
  export EDITOR="$VISUAL"
  alias vi="nvim"
fi
alias brc="nvim ~/.bashrc"
alias zrc="nvim ~/.zshrc"
alias nv="nvim"

# ================================================
# GIT
# ================================================
alias g="git"
alias gs="g status"
alias gpull="g pull"
alias gpush="g push"

# ================================================
# BREW
# ================================================
alias brewd="brew doctor"
alias brewi="brew install"
alias brewr="brew uninstall"
alias brews="brew search"
alias brewu="brew update --quiet \
                && brew upgrade \
                && brew cleanup"

# ================================================
# EZA
# ================================================
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

# ================================================
# TERMINAL
# ================================================
command -v code >/dev/null && alias code="code --reuse-window --add"
command -v cursor >/dev/null && alias cursor="cursor --reuse-window --add"
command -v windsurf >/dev/null && alias ws="windsurf --reuse-window --add"

# ================================================
# MISCELLANEOUS
# ================================================
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
