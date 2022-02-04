e_header "Changing shell to zsh"

if [[ ! "$SHELL" == *"zsh"* ]]; then
  chsh -s "$(command -v zsh)"  
fi

