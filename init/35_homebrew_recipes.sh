# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Shared Homebrew kegs
kegs=(
  jandedobbeleer/oh-my-posh
)

# Common Homebrew recipes
recipes=(
  asdf
  awscli
  awsebcli
  caddy
  curl
  direnv
  docker
  go-task/tap/go-task
  jandedobbeleer/oh-my-posh/oh-my-posh
  jq
  pulumi
  thefuck
)

brew_tap_kegs
brew_install_recipes
