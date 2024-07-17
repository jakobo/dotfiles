function bin_in_path {
  if [[ -n $ZSH_VERSION ]]; then
    builtin whence -p "$1" &> /dev/null
  else  # bash:
    builtin type -P "$1" &> /dev/null
  fi
  [[ $? -ne 0 ]] && return 1
  if [[ $# -gt 1 ]]; then
    shift  # We've just checked the first one
    is_bin_in_path "$@"
  fi
}

# Dotfiles and pipx (https://github.com/pipxproject/pipx)
path+=("~/.local/bin")
path+=("$DOTFILES/bin")

# User Bins
path+=("$HOME/bin")
path+=("/usr/local/bin")

# Android
path+=("$JAVA_HOME")
path+=("$ANDROID_HOME/tools/bin")
path+=("$ANDROID_HOME/tools")
path+=("$ANDROID_HOME/platform-tools")

export PATH
