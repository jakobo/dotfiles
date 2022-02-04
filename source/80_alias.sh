#!/usr/bin/env bash

### enable aliases to be sudo’ed
#
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo="sudo "
alias please="sudo"
alias pls="sudo"
alias plz="sudo"

### ubuntu update & upgrade
#
alias uu="sudo apt-get update && sudo apt-get upgrade -y"
alias uua="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y"

### safety
#
# Avoid stupidity with trash-cli: using https://github.com/sindresorhus/trash-cli
# or use default rm -i if trash is not installed
if type trash &>/dev/null; then
	alias rm="trash"
else
	alias rm="rm -i"
fi

### git
#
alias lg="git log --all --decorate --oneline --graph"

# gcloud
alias gcurl='curl --header "Authorization: Bearer $(gcloud auth print-identity-token)"'

### navigation
#
# go to the /home/$USER (~) directory and clears window of your terminal
alias q="cd ~ && clear"
#
[ -d ~/Pictures ] && alias pic="cd ~/Pictures"
[ -d ~/projects ] && alias pj="cd ~/projects"

### folders
#
alias ll="ls -AlFh"
alias la="ls -A"
alias l="ls -CF"

### PATH
#
# pretty print $PATH
# shellcheck disable=SC2139,SC2154
alias path="print -l $path"
# shellcheck disable=SC2139,SC2154
alias fpath="print -l $fpath"

### download
#
# web page with all assets
alias getpage="wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories"
# file with original filename
alias get="curl -O -L"

### wsl "open"
if [ -n "$WSL" ]; then
  alias open="explorer.exe"
fi

# IP addresses
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias grep='grep --color=auto'