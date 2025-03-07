#!/usr/bin/env zsh

#
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
#

# ================================================
# LOADING FILES
# ================================================
[ -f "$HOME/.shell/zsh/functions/lib/ai.zsh" ]      && source $HOME/.shell/zsh/functions/lib/ai.zsh
[ -f "$HOME/.shell/zsh/functions/lib/aws.zsh" ]      && source $HOME/.shell/zsh/functions/lib/aws.zsh
[ -f "$HOME/.shell/zsh/functions/lib/docker.zsh" ]   && source $HOME/.shell/zsh/functions/lib/docker.zsh
[ -f "$HOME/.shell/zsh/functions/lib/git.zsh" ]      && source $HOME/.shell/zsh/functions/lib/git.zsh
[ -f "$HOME/.shell/zsh/functions/lib/kubectl.zsh" ]  && source $HOME/.shell/zsh/functions/lib/kubectl.zsh
[ -f "$HOME/.shell/zsh/functions/lib/network.zsh" ]  && source $HOME/.shell/zsh/functions/lib/network.zsh
[ -f "$HOME/.shell/zsh/functions/lib/ssh.zsh" ]      && source $HOME/.shell/zsh/functions/lib/ssh.zsh
[ -f "$HOME/.shell/zsh/functions/lib/usefull.zsh" ]  && source $HOME/.shell/zsh/functions/lib/usefull.zsh
