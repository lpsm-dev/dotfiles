#!/bin/bash
set -e

backup_dir="/Volumes/SSD/Backup_$(hostname -s)"

START=$(date "+%s")
caffeinate sudo rsync --archive --verbose --human-readable --itemize-changes --progress \
  --compress --delete --delete-excluded  --exclude='/Network' --exclude='/System' --exclude='/Volumes' \
  --exclude='/bin' --exclude='/cores' --exclude='/dev' --exclude='/private' \
  --exclude='/sbin' --exclude='/tmp' --exclude='/usr' --exclude='/var' \
  --exclude='*/.Trash/*' --exclude='*/.DS_Store' --exclude="/Applications" \
  --exclude='*/Cache*/' --exclude="/Library/Apple/" \
  --exclude='~/Downloads' --exclude='*.app' --exclude='*/.cache/*' --exclude='*.docset*' \
  /* "$backup_dir" 2>&1 | tee "$HOME/Documents/Backup/$(date '+%Y-%m-%d_%H%M%S.log')"

FINISH=$(date "+%s")
date '+%Y-%m-%d %H:%M:%S' >"$backup_dir/_lastbackup.log"
echo "total time: $(((FINISH - START) / 60)) minutes, $(((FINISH - START) % 60)) seconds" >>"$backup_dir/_lastbackup.log"
touch "$backup_dir/_lastbackup.log"
