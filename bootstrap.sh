#!/bin/sh

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
      error "Error: CLI package not found"
      exit 1
    fi
    sudo softwareupdate -i "$PROD"
    sudo rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    sudo xcodebuild -license accept
  else
    info "Xcode CLI is already installed"
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
      warn "Homebrew is already installed"
    fi
}

function setup_brew_deps() {
    info "Starting install Homebrew deps $pwd"
    brew bundle --file="$LOCAL_DOTFILES_HOME/Brewfile" --no-lock --verbose || true
    info "Running Homebrew cleanup"
    brew cleanup
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
    read -p "Do you really want to start MacOS setup? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        info "Starting macOS setup"
        bash "$LOCAL_DOTFILES_HOME/.macos"
    else
        info "MacOS setup canceled"
    fi
}

function setup_yazi_theme() {
    info "Setting up Yazi theme..."
    THEME_PATH="$LOCAL_DOTFILES_HOME/.config/yazi/flavors/catppuccin-mocha"
    PACKAGE_TOML="$LOCAL_DOTFILES_HOME/.config/yazi/package.toml"

    if [ ! -f "$PACKAGE_TOML" ]; then
        info "package.toml not found in $PACKAGE_TOML. Installing Yazi theme..."
        mkdir -p "$LOCAL_DOTFILES_PATH/.config/yazi/flavors"
        cd "$LOCAL_DOTFILES_PATH/.config/yazi/flavors" && ya pack -a yazi-rs/flavors:catppuccin-mocha
    elif grep -q "catppuccin-mocha.yazi" "$PACKAGE_TOML"; then
        warn "The Yazi theme is already installed and registered."
    else
        info "Installing Yazi theme..."
        cd "$LOCAL_DOTFILES_PATH/.config/yazi/flavors" && ya pack -a yazi-rs/flavors:catppuccin-mocha
    fi
}

function setup_stow() {
    info "Syncing dotfiles with Stow..."
    cd "$LOCAL_DOTFILES_HOME" && stow --target="$HOME" --adopt .
}

function setup_devbox() {
    info "Checking Devbox installation..."
    if ! command -v devbox >/dev/null 2>&1; then
        info "Devbox not found. Installing..."
        curl -fsSL https://get.jetify.com/devbox | bash
    else
        warn "Devbox is already installed."
    fi
}

function setup_neovim() {
    info "Setting up Neovim plugins..."
    local nvim_autoload="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"

    if [ ! -f "$nvim_autoload" ]; then
        info "Installing Vim-Plug for Neovim..."
        curl -fLo "$nvim_autoload" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        warn "Neovim plugins are already installed."
    fi
}

function setup_nix() {
    info "Checking Nix installation..."
    if ! command -v nix >/dev/null 2>&1; then
        info "Nix not found. Installing..."
        sh <(curl -L https://nixos.org/nix/install) --daemon
    else
        warn "Nix is already installed."
    fi
}

function setup_misc() {
    info "Creating necessary directories..."
    mkdir -p "$HOME/.secrets"
    mkdir -p "$HOME/.nvm"
}

function setup_terminal() {
    info "Starting terminal setup..."
    setup_stow
    setup_devbox
    setup_neovim
    setup_nix
    setup_yazi_theme
    setup_misc
    info "Terminal setup completed!"
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
        warn "Cronjob already exists"
    fi
}

function setup_git_submodules() {
    info "Checking and updating Git submodules..."
    cd $LOCAL_DOTFILES_PATH

    if [ -f ".gitmodules" ]; then
        if [ ! -d ".git/modules" ]; then
            info "Initializing Git submodules..."
            git submodule init
        else
            info "Git submodules already initialized."
        fi

        info "Updating Git submodules..."
        git submodule update --recursive --remote
    else
        warn "No submodules found in the repository. Skipping submodule setup."
    fi
}

# ==============================================
# MAIN
# ==============================================
VERSION="0.0.6"

echo -e "${YELLOW}"
cat << EOF
👨🏻‍🚀 Hey Folks! This is my Dotfiles - $VERSION
   Get ready for your ultimate MacOs setup!

██████╗░░█████╗░████████╗███████╗██╗██╗░░░░░███████╗░██████╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║░░░░░██╔════╝██╔════╝
██║░░██║██║░░██║░░░██║░░░█████╗░░██║██║░░░░░█████╗░░╚█████╗░
██║░░██║██║░░██║░░░██║░░░██╔══╝░░██║██║░░░░░██╔══╝░░░╚═══██╗
██████╔╝╚█████╔╝░░░██║░░░██║░░░░░██║███████╗███████╗██████╔╝
╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═════╝░

EOF
echo -e "${RESET}"

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
    setup_git_submodules
    setup_brew_deps
    setup_macos
    setup_terminal
    setup_ai_tools
    setup_automations
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

echo -e "${YELLOW}"
cat << EOF



░█████╗░░█████╗░███╗░░██╗░██████╗░██████╗░░█████╗░████████╗░██████╗██╗
██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║
██║░░╚═╝██║░░██║██╔██╗██║██║░░██╗░██████╔╝███████║░░░██║░░░╚█████╗░██║
██║░░██╗██║░░██║██║╚████║██║░░╚██╗██╔══██╗██╔══██║░░░██║░░░░╚═══██╗╚═╝
╚█████╔╝╚█████╔╝██║░╚███║╚██████╔╝██║░░██║██║░░██║░░░██║░░░██████╔╝██╗
░╚════╝░░╚════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═════╝░╚═╝


🎉 All dotfiles installation is now complete 🎉


👨🏻‍🚀 Restart your mac to reflect the settings. Happy Coding🫰🏻

    run in your terminal:
      sudo reboot

EOF
echo -e "${RESET}"
