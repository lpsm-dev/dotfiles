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
LOCAL_DOTFILES_PATH="$HOME/.dotfiles-local"
LOCAL_DOTFILES_HOME="$LOCAL_DOTFILES_PATH/home"

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

function setup_git_project() {
    info "Iniciando setup no macOS"
	if [ ! -d "$LOCAL_DOTFILES_PATH" ]; then
		info "Cloning $GIT_DOTFILES_URL to $LOCAL_DOTFILES_PATH"
		git clone --depth=1 $GIT_DOTFILES_URL $LOCAL_DOTFILES_PATH	
	fi
}

function setup_macos() {
	info "Iniciando setup do macOS"
	bash "$LOCAL_DOTFILES_HOME/.macos"
}

function setup_brew() {
	info "Iniciando setup do Brew"
	if is_command_not_in_path brew; then
		info "Instalando brew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
	brew bundle --file="$LOCAL_DOTFILES_HOME/Brewfile" --no-lock --verbose || true
}

# ==============================================
# MAIN
# ==============================================

OS=$(uname -s)
case $OS in
Darwin)
	setup_git_project
	setup_macos
	setup_brew
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Setup Dotfiles finalizado!"
