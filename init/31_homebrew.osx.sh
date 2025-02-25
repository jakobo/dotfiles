# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# OSX: (was installed via apt in ubuntu)
brew install \
  automake \
  autoconf \
  curl \
  gpg \
  openssl \
  pinentry-mac \
  readline \
  wget
