# asdf
if [ -d "${HOME}/.asdf" ]; then
	log_success "asdf already exists"
else
	log_info "Installing asdf"
	git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf"
	cd "${HOME}/.asdf" || {
		log_failure_and_exit "Could not find .asdf" 1>&2
	}
	git checkout "$(git describe --abbrev=0 --tags)"
	cd "${HOME}" || {
		log_failure_and_exit "Could not find ${HOME}" 1>&2
	}
	log_success "Successfully installed asdf"
	log_info "Shell must be restarted before asdf is available on your PATH. Re-run this script."
	exit 0
fi

# Install asdf plugins
function asdf_install_plugins() {
  recipes=($(setdiff "${plugins[*]}" "$(asdf plugin list)"))
  if (( ${#plugins[@]} > 0 )); then
    e_header "Installing asdf plugins: ${plugins[*]}"
    for plugin in "${plugins[@]}"; do
      asdf install $plugin latest
    done
  fi
}
