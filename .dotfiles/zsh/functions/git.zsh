#!/usr/bin/env zsh

gz() {
  git add README.md
  git commit -m "docs: update readme file"
  git push
}

gi() {
  git add README.md
  git commit -m "chore: just dummy changes"
  git push
}

gitclean() {
  echo "🚨 Cleanup your commit history"
  git checkout --orphan latest_branch
  git add -A
  git commit -am "chore: initial commit - include config files"
  git branch -D main
  git branch -m main
  git push -f origin main
}

commits() {
  git log $1 --oneline --reverse | cut -d' ' -f 1 | tr '/n' ' '
}

current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
