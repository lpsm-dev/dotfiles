#!/usr/bin/env zsh

#
# ██╗  ██╗██╗   ██╗██████╗ ███████╗ ██████╗████████╗██╗     
# ██║ ██╔╝██║   ██║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██║     
# █████╔╝ ██║   ██║██████╔╝█████╗  ██║        ██║   ██║     
# ██╔═██╗ ██║   ██║██╔══██╗██╔══╝  ██║        ██║   ██║     
# ██║  ██╗╚██████╔╝██████╔╝███████╗╚██████╗   ██║   ███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝
#                                                          

function kdebug() {
    kubectl run -i --rm --tty debug --image=busybox --restart=Never -- sh
}

function kadd(){
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Os params para o kubeconfig file and kubeconfig context name devem ser preenchidos..."
    else
        kubectl kc add --file="$1" --context-name="$2"
    fi
}
