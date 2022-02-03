printf "✅  %s\\n" "Source asdf completions prior to oh-my-zsh running it's own compinit."
# shellcheck disable=SC2206
fpath=($HOME/.asdf/completions $fpath)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	asdf
	thefuck
	git
	golang
	node
	npm
	python
	pip
	zsh-syntax-highlighting
)