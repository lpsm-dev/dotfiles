## Extract function.
#
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

## Make a Directory and cd into it.
#
mcd(){
  mkdir -pv "$@"
  cd "$@"
}

## Save a file to tmp.
#
saveit() {
  cp $1 ${HOME}/tmp/${1}.saved
}

## Move a content to tmp.
#
mvtmp(){
  mv $1 ~/tmp/
}

## Copy a content to tmp.
#
cptmp(){
  cp -r $1 ~/tmp/
}

## View most commonly used commands. Depends on your history output format.
#
used(){
  if [ $1 ]
  then
    history | awk "{print $4}" | sort | uniq -c | sort -nr | head -n $1
  else
    history | awk "{print $4}" | sort | uniq -c | sort -nr | head -n 10
  fi
}

## Running setup pre-commit
#
precommit(){
  pre-commit install
  pre-commit install --hook-type commit-msg
  pre-commit autoupdate
}
