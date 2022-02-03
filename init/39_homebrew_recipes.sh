# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Common Homebrew recipes
recipes=(
  awscli
  awsebcli
  jq
  thefuck
)

brew_install_recipes
