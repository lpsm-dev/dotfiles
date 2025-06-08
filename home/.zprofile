#!/usr/bin/env zsh
# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"

#
# ███████╗██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#   ███╔╝ ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
#  ███╔╝  ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ███████╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝
#

if [ $(uname) = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
