#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables

HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

# Functions

is_command_not_in_path() { ! [ -x "$(command -v "$1")" ]; }

# Main

if is_command_not_in_path brew; then
	echo 'Installing brew...'
    /bin/bash -c "$(curl -fsSL $HOMEBREW_INSTALL_URL)"
fi

brew update
brew upgrade

echo "Dotfiles setup complete!"
