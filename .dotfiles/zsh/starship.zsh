#!/usr/bin/env zsh

# ███████╗████████╗ █████╗ ██████╗ ████████╗███████╗██╗  ██╗██╗██████╗ 
# ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║██║██╔══██╗
# ███████╗   ██║   ███████║██████╔╝   ██║   ███████╗███████║██║██████╔╝
# ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ╚════██║██╔══██║██║██╔═══╝ 
# ███████║   ██║   ██║  ██║██║  ██║   ██║   ███████║██║  ██║██║██║     
# ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝╚═╝     

export STARSHIP_CONFIG=$HOME/.config/starship.toml
export STARSHIP_CACHE=$HOME/.starship/cache

if [ ! -f "`which starship`" ]; then
	echo "Installing starship ..."
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

eval "$(starship init zsh)"
