#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# ==============================================
# VARIABLES
# ==============================================

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

GIT_DOTFILES_URL="https://github.com/lpsm-dev/dotfiles.git"
DEFAULT_DOTFILES_PATH="~/.dotfiles"
DEFAULT_DOTFILES_HOME="$DEFAULT_DOTFILES_PATH/home"

# ==============================================
# FUNCTIONS
# ==============================================

function info {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${GREEN}╰┈➤ $1${RESET}"
	else
		echo "$1"
	fi
}

function warn {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${YELLOW}╰┈➤ $1${RESET}"
	else
		echo "$1"
	fi
}

function error {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${RED}╰┈➤ $1${RESET}"
	else
		echo "$1"
	fi
}

function is_command_not_in_path() { ! [ -x "$(command -v "$1")" ]; }

function setup_macos() {
	bash "$DEFAULT_DOTFILES_HOME/.macos"
}

function setup_brew() {
	if is_command_not_in_path brew; then
		info "Instalando brew..."
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
	fi
	brew bundle --file="$DEFAULT_DOTFILES_HOME/Brewfile"
}

# ==============================================
# MAIN
# ==============================================

OS=$(uname -s)
case $OS in
Darwin)
    info "Iniciando setup no macOS"
	# Setup Git Project in local environment
	if [ ! -d "$DEFAULT_DOTFILES_PATH" ]; then
		info "Cloning $GIT_DOTFILES_URL to $DEFAULT_DOTFILES_PATH"
		git clone --depth=1 $GIT_DOTFILES_URL $DEFAULT_DOTFILES_PATH	
	fi
	# Setup MacOs
	setup_macos
	# Setup Brew
	setup_brew
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Setup Dotfiles finalizado!"
