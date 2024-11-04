# Homebrew for all!

if [[ ! "$(type -P brew)" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> $HOME/.bashrc
  # Try shell env until it works
  if [[ ! "$(type -P /usr/local/bin/brew)" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  if [[ ! "$(type -P /opt/homebrew/bin/brew)" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  if [[ ! "$(type -P /home/linuxbrew/.linuxbrew/bin/brew)" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1

e_header "Updating Homebrew"
brew doctor
brew update

