#!/usr/bin/env bash

is_command_not_in_path() { ! [ -x "$(command -v "$1")" ]; }

# Install command-line tools using Homebrew.

if is_command_not_in_path brew; then
	echo 'Installing brew...'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install packages
brew bundle install --file Brewfile

brew doctor
