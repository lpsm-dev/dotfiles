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

# ==============================================
# MAIN
# ==============================================

OS=$(uname -s)
case $OS in
Darwin)
    info "Setting up for macOS"
	if [ ! -d "$DEFAULT_DOTFILES_PATH" ]; then
		# Setup Dotfiles Project
		info "Cloning $GIT_DOTFILES_URL to $DEFAULT_DOTFILES_PATH"
		git clone --depth=1 $GIT_DOTFILES_URL $DEFAULT_DOTFILES_PATH

		# Setup MacOs
		if [ "$(id -u)" -eq 0 ]; then
			bash "$DEFAULT_DOTFILES_PATH/terminal/.macos"
		else
			error "User sem permissão de administrador. Tente novamente..." && exit 1
		fi

		# Setup Brew
		if is_command_not_in_path brew; then
			info "Instalando brew..."
			curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
		fi

		# Setup Brew Dependencies
		brew bundle --file="$DEFAULT_DOTFILES_PATH/terminal/Brewfile"
	fi
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Setup Dotfiles finalizado!"
