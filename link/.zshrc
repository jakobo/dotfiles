#!/bin/bash
# shellcheck disable=SC2034

### CONSTANTS
# DBUS Information and LibGL
# export $(dbus-launch)
export LIBGL_ALWAYS_INDIRECT=1

# Java & Android
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=$HOME/Android

# SSH
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# oh-my-zsh options
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

### /CONSTANTS

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
### /DOTFILES

# Custom oh-my-zsh init
source_if_exists() {
	if [ -f "$1" ]; then
		# shellcheck disable=SC1090
		. "$1"
		printf "✅  Sourced:\\t%s\\n" "$1"
	else
		printf "🚨  Failed to source: %s\\n" "$1"
	fi
}

### oh-my-zsh
source_if_exists "$ZSH/oh-my-zsh.sh"

### z
source_if_exists "$HOME/z.sh"

### aliases
source_if_exists "$HOME/.aliases"

# shellcheck disable=SC1090
[ "$(uname -s)" = "Darwin" ] &&
	printf "%s\\n" "🦋  Load Navi" &&
	source <(navi widget zsh)

### https://starship.rs
# printf "%s\\n" "🚀  Load Starship shell prompt"
# eval "$(starship init zsh)"

# printf "\\n🏞  Environment Variables: \\n\\n"
# printenv

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initialize thefuck
[[ ! -x thefuck ]] || eval $(thefuck --alias)
