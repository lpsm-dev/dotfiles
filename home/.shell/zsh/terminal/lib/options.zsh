#!/usr/bin/env zsh

#
# ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗
# ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║
#    ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║
#    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║
#    ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
#    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
#

# Hide % on start
unsetopt PROMPT_SP

# History
HISTFILE=~/.zsh_history                     # Where to save history to disk
HISTSIZE=100000                             # Lines of history to keep in memory for current session
SAVEHIST=$HISTSIZE                          # Number of history entries to save to disk
HISTDUP=erase                               # Erase duplicates in the history file
HIST_STAMPS="yyyy-mm-dd"                    # Add timestamps to history
HISTORY_IGNORE="(ls|cd|pwd|exit|clear)*"    # Ignore these commands in history

# Options `man zshoptions`
setopt append_history         # Append history to the history file (no overwriting)
setopt extended_history       # special history format with timestamp
setopt hist_expire_dups_first # expire the oldest instance of command
setopt hist_ignore_dups       # Ignore duplicates
setopt hist_ignore_space      # Ignore commands that start with a space
setopt hist_verify            # Don't execute immediately upon history expansion.
setopt no_hist_beep           # No beep
setopt share_history          # Share history across terminals
setopt inc_append_history     # Immediately append to the history file, not just when a term is killed
setopt auto_cd                # Auto change to a dir without typing cd
