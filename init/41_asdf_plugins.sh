# Exit if Homebrew is not installed.
[[ ! "$(type -P asdf)" ]] && e_error "asdf plugins need asdf to install." && return 1

# Common Homebrew recipes
recipes=(
  deno
  nodejs
  python
  shellcheck
  shfmt
)

asdf_install_plugins
