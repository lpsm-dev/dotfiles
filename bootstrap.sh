#!/bin/sh

#
# ██████╗  ██████╗  ██████╗ ████████╗███████╗████████╗██████╗  █████╗ ██████╗ 
# ██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗
# ██████╔╝██║   ██║██║   ██║   ██║   ███████╗   ██║   ██████╔╝███████║██████╔╝
# ██╔══██╗██║   ██║██║   ██║   ██║   ╚════██║   ██║   ██╔══██╗██╔══██║██╔═══╝ 
# ██████╔╝╚██████╔╝╚██████╔╝   ██║   ███████║   ██║   ██║  ██║██║  ██║██║     
# ╚═════╝  ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     
#                                                                            

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
LOCAL_OH_MY_ZSH_PATH="$HOME/.dotfiles-local"

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
    info "Checking for new updates on macOS..."
    sudo softwareupdate -iaR || {
        error "Failed to update macOS. Please check manually" && exit 1
    }
}

function setup_system_xcode() {
    info "Starting Xcode Command Line Tools setup..."
    if ! xcode-select -p &>/dev/null; then
        info "Installing Xcode Command Line Tools..."
        sudo touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        local PROD=$(softwareupdate -l | grep -B 1 -E 'Command Line Tools' | \
                    awk -F"*" '/^ +\\*/ {print $2}' | sed 's/^ *//' | tail -n1)
        if [ -z "$PROD" ]; then
            error "Error: CLI package not found."
            exit 1
        fi
        sudo softwareupdate -i "$PROD"
        sudo rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        sudo xcodebuild -license accept
    else
        info "Xcode CLI is already installed."
    fi
}

function setup_brew() {
	info "Starting Homebrew setup..."
	if is_command_not_in_path brew; then
		info "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [[ "$(uname -m)" == "arm64" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
	else
	  info "Homebrew is already installed"
	fi
}

function setup_brew_deps() {
	info "Starting install Homebrew deps $pwd"
	brew bundle --file="$LOCAL_DOTFILES_HOME/Brewfile" --no-lock --verbose || true
}

function setup_git_project() {
    info "Starting git project setup $GIT_DOTFILES_URL in your local environment"
	if [ ! -d "$LOCAL_DOTFILES_PATH" ]; then
		info "Cloning $GIT_DOTFILES_URL to $LOCAL_DOTFILES_PATH"
		git clone --depth=1 $GIT_DOTFILES_URL $LOCAL_DOTFILES_PATH
	else
	    info "The dotfile project $GIT_DOTFILES_URL already exists at $LOCAL_DOTFILES_PATH. We will update the code"
		cd $LOCAL_DOTFILES_PATH && git pull
	fi
}

function setup_macos() {
	read -p "Do you really want to start macOS setup? (y/n): " confirm
	if [[ "$confirm" =~ ^[Yy]$ ]]; then
		info "Starting macOS setup"
		bash "$LOCAL_DOTFILES_HOME/.macos"
	else
		info "macOS setup canceled"
	fi
}

function setup_terminal_zsh(){
	info "Changing shell to zsh"
	SHELL_PATH=$(command -v zsh)
	if ! grep "$SHELL_PATH" /etc/shells > /dev/null 2>&1 ; then
		sh -c "echo $SHELL_PATH >> /etc/shells"
	fi
	chsh -s "$SHELL_PATH" "$USER"
	info "Starting terminal setup - oh-my-zsh"
	if [ ! -d "$LOCAL_OH_MY_ZSH_PATH" ]; then
		info "Installing oh-my-zsh"
		sh -c "`curl -fsSL https://raw.github.com/gullitmiranda/oh-my-zsh/master/tools/install.sh`"
	else
		info "The oh-my-zsh is already installed"
	fi
}

function setup_terminal(){
	info "Starting terminal setup - Folders"
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.aws/ ~/ 	
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.config/ ~/ 	
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.docker/ ~/
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.dotfiles/ ~/
	info "Starting terminal setup - Files"
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.Brewfile ~/ 
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.gitignore ~/ 
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.zprofile ~/
	ln -sfnv ${LOCAL_DOTFILES_HOME}/.zshrc ~/ 
}

function setup_ai_tools(){
	read -p "Do you really want to start the AI tools setup? (y/n): " confirm
	if [[ "$confirm" =~ ^[Yy]$ ]]; then
		info "Starting Ollama service..."
		brew services start ollama
		info "Waiting for Ollama service to start..." && sleep 5
		info "Downloading DeepSeek Coder model..."
		ollama pull deepseek-coder:6.7b
		info "Setup complete! You can now use DeepSeek with Ollama"
	else
		info "AI Tools setup canceled"
	fi
}

function setup_automations(){
	if ! crontab -l | grep -q "brew file update"; then
		info "Adding cronjob..."
		(crontab -l 2>/dev/null; echo "30 12 * * * /bin/bash -c 'PATH=\"/opt/homebrew/bin:/usr/local/bin:$PATH\"; brew file update'") | crontab -
	else
		info "Cronjob already exists"
	fi
}

# ==============================================
# MAIN
# ==============================================

VERSION="0.0.4"

info "Hey Folks! Welcome to bootstrap MacOs! - $VERSION"
sudo -v
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

read -p "This script will perform several configurations on your system. Do you want to continue? (y/N): " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    error "Operation canceled by the user." && exit 1
fi

OS=$(uname -s)
case $OS in
Darwin)
	setup_system_updates
	setup_system_xcode
	setup_brew
	setup_git_project
	setup_brew_deps
	setup_macos
	setup_terminal_zsh
	setup_terminal
	setup_ai_tools
	setup_automations
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Dotfiles setup completed!"
