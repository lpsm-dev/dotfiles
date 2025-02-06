#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos)

# Load files

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.shell/zsh/alias/personal.zsh" ]     && source $HOME/.shell/zsh/alias/personal.zsh
[ -f "$HOME/.shell/zsh/alias/work.zsh" ]         && source $HOME/.shell/zsh/alias/work.zsh
[ -f "$HOME/.shell/zsh/zinit.zsh" ]              && source $HOME/.shell/zsh/zinit.zsh
[ -f "$HOME/.shell/zsh/starship.zsh" ]           && source $HOME/.shell/zsh/starship.zsh
[ -f "$HOME/.shell/zsh/exports.zsh" ]            && source $HOME/.shell/zsh/exports.zsh
[ -f "$HOME/.shell/zsh/options.zsh" ]            && source $HOME/.shell/zsh/options.zsh
[ -f "$HOME/.shell/zsh/functions/git.zsh" ]      && source $HOME/.shell/zsh/functions/git.zsh
[ -f "$HOME/.shell/zsh/functions/ssh.zsh" ]      && source $HOME/.shell/zsh/functions/ssh.zsh
[ -f "$HOME/.shell/zsh/functions/docker.zsh" ]   && source $HOME/.shell/zsh/functions/docker.zsh
[ -f "$HOME/.shell/zsh/functions/common.zsh" ]   && source $HOME/.shell/zsh/functions/common.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
