#!/usr/bin/env zsh

#
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#

# ================================================
# SETUP AWS
# ================================================
alias actx="aws configure list-profiles | fzf | xargs -I {} aws sso login --profile {}"

# ================================================
# SETUP DOCKER + DOCKER COMPOSE
# ================================================
alias d="docker $*"
alias dc="docker-compose $*"
if [[ -x $(which docker) ]]; then
  alias kali="docker run --rm -ti kalilinux/kali bash"
  alias ubuntu="docker run --rm -ti ubuntu:latest bash"
  alias debian="docker run --rm -ti debian:latest bash"
  alias centos="docker run --rm -ti centos:latest bash"
  alias archlinux="docker run --rm -ti archlinux:latest bash"
fi

# ================================================
# SETUP KUBECTL
# ================================================
alias k="kubectl --insecure-skip-tls-verify"
alias kctx="kubectl config current-context"
alias kview="kubectl config view"
alias kns="kubectl get ns"

# ================================================
# SETUP HELM
# ================================================
alias h="helm --kube-insecure-skip-tls-verify"
