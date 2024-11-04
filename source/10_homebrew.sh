  # Try shell env until it works
  if [[ "$(type -P /usr/local/bin/brew)" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  if [[ "$(type -P /opt/homebrew/bin/brew)" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  if [[ "$(type -P /home/linuxbrew/.linuxbrew/bin/brew)" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi