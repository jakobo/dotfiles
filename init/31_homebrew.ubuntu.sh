# ubuntu-only stuff. Abort if not OSX.
is_ubuntu || return 1
[[ ! "$(type -P brew)" ]] && e_error "Brew fixes need Homebrew." && return 1

# Fix homebrew links that require dev files in /opt
# Something fucky installs them 
ln -s $(brew --prefix)/opt $(brew --prefix)/Homebrew/opt
