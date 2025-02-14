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
# JAVA
# ================================================
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# ================================================
# NODE
# ================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# ================================================
# GO
# ================================================
export GOPATH=$HOME/go
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOTELEMETRY=off

# ================================================
# RUBY
# ================================================
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# ================================================
# RUST
# ================================================
export PATH="$HOME/.config/cargo/bin:$PATH"
export CARGO_HOME="$HOME/.config/cargo"
export RUSTUP_HOME="$HOME/.config/rustup"

# ================================================
# PYTHON
# ================================================
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
