e_header "Installing oh-my-zsh"

# install oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
	e_success "oh-my-zsh already installed"
else
	e_arrow "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"

	e_arrow "Installing zsh-syntax-highlighting plugin"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  e_success "oh-my-zsh installed"
fi