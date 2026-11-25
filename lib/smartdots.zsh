#!/usr/bin/env bash

# Quick change directories
# Expands .... -> ../../../
#
# License: MIT

smartdots() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N smartdots
bindkey . smartdots
