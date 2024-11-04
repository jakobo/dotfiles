# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

brew install asdf direnv go-task/tap/go-task jandedobbeleer/oh-my-posh/oh-my-posh jq thefuck