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
# SUPPORT FUNCTIONS
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
# MAIN FUNCTIONS
# ==============================================

function setup_system_updates() {
    info "Instalando atualizações do sistema..."
    sudo softwareupdate -iaR || {
        error "Falha na instalação das atualizações. Verifique manualmente" && exit 1
    }
}

function setup_brew() {
	info "Iniciando setup do Homebrew"
	if is_command_not_in_path brew; then
		info "Instalando Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [[ "$(uname -m)" == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
	else
	  info "Homebrew já está instalado."
	fi
}

function setup_brew_deps() {
	info "Iniciando setup das deps do Homebrew"
	brew bundle --file="$LOCAL_DOTFILES_HOME/Brewfile" --no-lock --verbose || true
}

function setup_git_project() {
    info "Iniciando setup no macOS"
	if [ ! -d "$LOCAL_DOTFILES_PATH" ]; then
		info "Cloning $GIT_DOTFILES_URL to $LOCAL_DOTFILES_PATH"
		git clone --depth=1 $GIT_DOTFILES_URL $LOCAL_DOTFILES_PATH
	else
	    info "Dotfile project $GIT_DOTFILES_URL alredy exists in $LOCAL_DOTFILES_PATH", trying to update
		cd $LOCAL_DOTFILES_PATH && git pull
	fi
}

function setup_macos() {
	info "Iniciando setup do macOS"
	bash "$LOCAL_DOTFILES_HOME/.macos"
}

# ==============================================
# MAIN
# ==============================================

if [ "$EUID" -ne 0 ]; then
	echo "Esse script requer privilégios de administrador."
	exit 1
fi

OS=$(uname -s)
case $OS in
Darwin)
	setup_system_updates
	setup_brew && setup_brew_deps
	setup_git_project
	setup_macos
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Setup dotfiles finalizado!"
