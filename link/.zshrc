#!/bin/bash
# shellcheck disable=SC2034

### DOTFILES
# Where the magic happens.
export DOTFILES=~/.dotfiles

function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src

# yarn
# see node setup
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
# placeholder
# see init/50_node.sh
# pnpm end
