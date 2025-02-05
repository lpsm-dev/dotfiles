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

# ==============================================
# FUNCTIONS
# ==============================================

function error {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${RED}$1${RESET}"
	else
		echo "$1"
	fi
}

function info {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${GREEN}$1${RESET}"
	else
		echo "$1"
	fi
}

function warn {
	if [ -t 0 ] && [ -t 1 ]; then
		echo -e "${YELLOW}$1${RESET}"
	else
		echo "$1"
	fi
}

function is_command_not_in_path() { ! [ -x "$(command -v "$1")" ]; }

# ==============================================
# MAIN
# ==============================================

os_name="$(uname -s)"
case "${os_name}" in
Darwin*)
    info "Setting up for macOS"
    git clone --depth=1 https://github.com/lpsm-dev/dotfiles.git ~/.dotfiles
    ;;
*)
    error "Unsupported OS: ${os_name}"
    exit 1
    ;;
esac

info "> Dotfiles setup complete!"
