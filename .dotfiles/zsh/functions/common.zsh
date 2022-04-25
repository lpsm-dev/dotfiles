#!/usr/bin/env zsh

extract(){
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1        ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1       ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjvf $1      ;;
      *.tgz)       tar xzvf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

mcd(){
  mkdir -pv "$@"
  cd "$@"
}

saveit() {
  cp $1 ${HOME}/tmp/${1}.saved
}

mvtmp(){
  mv $1 ~/tmp/
}

cptmp(){
  cp -r $1 ~/tmp/
}

used(){
  if [ $1 ]
  then
    history | awk "{print $4}" | sort | uniq -c | sort -nr | head -n $1
  else
    history | awk "{print $4}" | sort | uniq -c | sort -nr | head -n 10
  fi
}

precommit(){
  pre-commit install
  pre-commit install --hook-type commit-msg
  pre-commit autoupdate
}

monk() {
  if [ "$1" = "sad" ]; then
    printf "( ͡° ʖ̯ ͡°)\n"
    elif [ "$1" = "sly" ]; then
    printf "( ͡° ͜ʖ ͡°)\n"
    elif [ "$1" = "idk" ]; then
    printf "¯\_(ツ)_/¯\n"
  else
    printf "error: name the monk!\n"
  fi
}
