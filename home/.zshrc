#!/usr/bin/env zsh

#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

# ================================================
# LOADING MACOS
# ================================================
XDG_CACHE_HOME="$HOME/.cache"
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_DESKTOP_DIR="$HOME/"
XDG_STATE_HOME="$HOME/.local/state"

# ================================================
# LOADING FILES
# ================================================
[ -f "$HOME/.shell/zsh/alias/all.zsh" ]       && source $HOME/.shell/zsh/alias/all.zsh
[ -f "$HOME/.shell/zsh/functions/all.zsh" ]   && source $HOME/.shell/zsh/functions/all.zsh
[ -f "$HOME/.shell/zsh/terminal/all.zsh" ]    && source $HOME/.shell/zsh/terminal/all.zsh

# ================================================
# LOADING SPECIAL CASES
# ================================================
[ -f "$HOME/.shell/zsh/exports/lib/_special.zsh" ]  && source $HOME/.shell/zsh/exports/lib/_special.zsh
if [ -f "$HOME/.shell/zsh/exports/lib/_secrets.zsh" ]; then
  source "$HOME/.shell/zsh/exports/lib/_secrets.zsh" > /dev/null 2>&1
fi
