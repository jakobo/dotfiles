# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Shared Homebrew kegs
kegs=(
  mongodb/brew
)

# Common Homebrew recipes
recipes=(
  mongodb-database-tools
  mongosh
)

brew_tap_kegs
brew_install_recipes
