#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

# ================================================
# LOADING FILES
# ================================================

[ -f "$HOME/.shell/zsh/exports/all.zsh" ]   && source $HOME/.shell/zsh/exports/all.zsh

# OpenSSH variables
export PATH=$(brew --prefix openssh)/bin:$PATH
# Go variables
export GOROOT="$(brew --prefix golang)/libexec"
