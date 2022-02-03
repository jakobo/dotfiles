grep -q -i "microsoft" /proc/version 2>/dev/null && export WSL=1

if [ -n "$WSL" ]; then
	### WSL Patch (needed until host binding is fixed)
	$DOTFILES/bin/wsl-host-patch/WSLHostPatcher.exe | grep -iv "dll" | sed -e '/^/ s/^/🔗  /'

	### Send all XConfig to Windows
	export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
	export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
	export WSL_CLIENT=$(bash.exe -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(.\d+){3}'")
	export DISPLAY=$WSL_HOST:0
else
	### Common Linux Setup
	export DISPLAY=:0
fi