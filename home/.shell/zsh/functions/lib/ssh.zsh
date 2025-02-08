#!/usr/bin/env zsh

#
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
#

genssh() {
  local key_name="$1"

  if [ -z "$key_name" ]; then
    echo "Please provide a name for the SSH key."
    return 1
  fi

  ssh-keygen -t rsa -b 4096 -a 100 -f ~/.ssh/$key_name -q -N "" -C ""
  echo "SSH key $key_name generated successfully."

  echo "Add SSH key $key_name to keychain. Remember to add the ssh key pub in git remote server (github, gitlab, azure devops...)"
}

addssh() {
  ssh-add ~/.ssh/gitlab-lpsm-dev
  ssh-add ~/.ssh/github-lpsm-dev
}
