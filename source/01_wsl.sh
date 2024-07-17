# WSL-only stuff. Abort if not WSL.
# Do this before Ubuntu or other OS-specific calls in case we need to be aware of a WSL env
is_wsl || return 1

### WSL Patch (needed until host binding is fixed)
# $DOTFILES/bin/wsl-host-patch/WSLHostPatcher.exe | grep -iv "dll" | sed -e '/^/ s/^/🔗  /'

### Send all XConfig to Windows
export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export WSL_CLIENT=$(bash.exe -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(.\d+){3}'")

# Disable browser call as WSL can't open browsers reliably
# export DISPLAY=$WSL_HOST:0
export BROWSER=/usr/bin/true