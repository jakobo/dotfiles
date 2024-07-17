# ubuntu-only stuff. Abort if not OSX.
is_ubuntu || return 1
[[ ! "$(type -P brew)" ]] && e_error "Brew fixes need Homebrew." && return 1

# Ubuntu needs to give permission to Caddy to bind to port 80 and 443
sudo setcap CAP_NET_BIND_SERVICE=+eip $(readlink -f $(which caddy))