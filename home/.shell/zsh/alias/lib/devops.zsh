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
alias actx="PROFILE=\$(aws configure list-profiles | fzf) && aws sso login --profile \$PROFILE && export AWS_PROFILE=\$PROFILE && REGION=\$(echo -e 'us-east-1\nsa-east-1' | fzf) && export AWS_DEFAULT_REGION=\$REGION && echo \"AWS_PROFILE set to: \$AWS_PROFILE, AWS_DEFAULT_REGION set to: \$REGION\""
alias eksctx='actx && CLUSTER=$(aws eks list-clusters | jq -r ".clusters[]" | fzf) && aws eks update-kubeconfig --name $CLUSTER --region $AWS_DEFAULT_REGION'

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
alias kai="kubectl-ai"

# ================================================
# SETUP HELM
# ================================================
alias h="helm --kube-insecure-skip-tls-verify"
