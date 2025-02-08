#!/usr/bin/env zsh

#
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
#

ssm() {
  INSTANCE_ID="$1"
  INSTANCE_PORT="${2:-80}"
  LOCAL_PORT="${3:-8082}"

  echo ""
  echo "INSTANCE_PORT $INSTANCE_PORT - LOCAL_PORT $LOCAL_PORT"

  if [ -z "$INSTANCE_ID" ]; then
    echo "Error: You need to pass a INSTANCE-ID"
  else
    aws ec2 describe-instances --instance-ids "$INSTANCE_ID" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "INSTANCE-ID $INSTANCE_ID exists in AWS"
      aws ssm start-session \
        --target $INSTANCE_ID \
        --document-name AWS-StartPortForwardingSession \
        --parameters '{"portNumber":["'$INSTANCE_PORT'"],"localPortNumber":["'$LOCAL_PORT'"]}'
    else
      echo "Instance $INSTANCE_ID does not exist in AWS. Please, pass a correct INSTANCE-ID"
    fi
  fi
}
