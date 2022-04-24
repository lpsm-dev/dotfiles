gz(){
  git add README.md
  git commit -m "docs: update readme file"
  git push
}

gitclean(){
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
