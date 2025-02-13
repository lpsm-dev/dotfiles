#!/bin/sh

normal=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

if ! command -v aichat >/dev/null; then
  printf "%sError: aichat not found in the system.\n" "$red"
  exit 127
fi

git_diff="$(git diff --staged --no-color)"
if [ -z "$git_diff" ]; then
  printf "%sNothing staged to commit.\n" "$red"
  exit 1
fi

commit_message="$(aichat --role commit --no-stream \
  "$git_diff" | fmt --width 90)"

printf "%s$commit_message" "$white"
printf "\n"

if [ -z "$NONINTERACTIVE" ]; then
  printf "\n%sCommit with this (y), edit message first (e), or quit (q)\
  [y\\\e\\\q] %s> " "${bold}${cyan}" "$normal"
  read -r choice
else
  choice="y"
fi

case "$choice" in
[yY])
  git commit --message "$commit_message"
  ;;
[eE])
  git commit --edit --message "$commit_message"
  ;;
*)
  printf "Aborted.\n"
  exit 1
  ;;
esac
