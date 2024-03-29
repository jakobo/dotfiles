# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes that are OSX-specific. These let us build a lot of other stuff
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
  pintentry
  pinentry-mac
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

# https://github.com/cli/cli/tree/trunk#macos
recipes+=(gh)

brew_install_recipes
