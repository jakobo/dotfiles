# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
  coreutils
  automake
  autoconf
  curl
  gpg
  openssl
  libyaml
  readline
  libxslt
  libtool
  sqlite3
  unixodbc
  xz
  wget
  zlib
)

# https://github.com/phpbrew/phpbrew/wiki/Requirement
recipes+=(
  bison re2c
)

brew_install_recipes
