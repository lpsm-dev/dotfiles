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
    info "Instalando atualizações do sistema..."
    sudo softwareupdate -iaR || {
        error "Falha na instalação das atualizações. Verifique manualmente" && exit 1
    }
}

function setup_system_xcode() {
    info "Verificando Xcode Command Line Tools..."
    if ! xcode-select -p &>/dev/null; then
        info "Instalando Xcode Command Line Tools..."
        sudo touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        local PROD=$(softwareupdate -l | grep -B 1 -E 'Command Line Tools' | \
                    awk -F"*" '/^ +\\*/ {print $2}' | sed 's/^ *//' | tail -n1)
        if [ -z "$PROD" ]; then
            error "Erro: Pacote CLI não encontrado."
            exit 1
        fi
        sudo softwareupdate -i "$PROD"
        sudo rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        sudo xcodebuild -license accept
    else
        info "Xcode CLI já está instalado."
    fi
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
	info "Iniciando setup das deps do Homebrew $pwd"
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

function setup_terminal(){
	info "Iniciando setup terminal - Folders"
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.aws/ ~/ 	
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.config/ ~/ 	
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.docker/ ~/
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.dotfiles/ ~/
	info "Iniciando setup terminal - Files"
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.gitignore ~/ 
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.zprofile ~/
	ln -sfnv ${LOCAL_DOTFILES_PATH}/.zshrc ~/ 
	info "Iniciando setup terminal - oh-my-zsh"
	if [ ! -d "$LOCAL_OH_MY_ZSH_PATH" ]; then
		info "Instalando oh-my-zsh"
		sh -c "`curl -fsSL https://raw.github.com/gullitmiranda/oh-my-zsh/master/tools/install.sh`"
	else
		info "O oh-my-zsh já está instalado"
	fi
}

# ==============================================
# MAIN
# ==============================================

info "Welcome to bootstrap MacOs!"
sudo -v
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

OS=$(uname -s)
case $OS in
Darwin)
	setup_system_updates
	setup_system_xcode
	setup_brew
	setup_git_project
	setup_macos
	setup_brew_deps
	setup_terminal
    ;;
*) error "Unsupported OS: ${os_name}" && exit 1 ;;
esac

info "Setup dotfiles finalizado!"
