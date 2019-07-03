#!/bin/bash

MARKPATH=$HOME/.marks

# Commands
function jump {
  cd -P "$MARKPATH/$1" 2> /dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"
  ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  mkdir -p "$MARKPATH"
  ls -l "$MARKPATH" | tail -n +2 | tr -s ' ' | cut -d' ' -f9- | column -ts' '
}

# Auto-completion for 'jump' and 'unmark' based on ~/.marks contents
_completemarks() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
  COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
  return 0
}
complete -o default -o nospace -F _completemarks jump unmark
