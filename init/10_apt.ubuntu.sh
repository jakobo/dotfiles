# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Core
sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove

# Custom ppa
sudo apt-add-repository ppa:git-core/ppa

# Second Update
sudo apt-get update

# Install
sudo apt install \
  build-essential \
  curl \
  git-core \
  gpg \
  nmap \
  pinentry-tty \
  telnet \
  wget \
  zsh
