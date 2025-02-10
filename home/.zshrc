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

[ -f "$HOME/.shell/zsh/alias/all.zsh" ]     && source $HOME/.shell/zsh/alias/all.zsh
[ -f "$HOME/.shell/zsh/functions/all.zsh" ] && source $HOME/.shell/zsh/functions/all.zsh
[ -f "$HOME/.shell/zsh/terminal/all.zsh" ]  && source $HOME/.shell/zsh/terminal/all.zsh

# ================================================
# SPECIAL CASES
# ================================================
#
# OpenSSH variables
export PATH=$(brew --prefix openssh)/bin:$PATH
# Go variables
export GOROOT="$(brew --prefix golang)/libexec"
