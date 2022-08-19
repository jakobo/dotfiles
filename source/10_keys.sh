# Global SSH Configuration
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Global GPG Configuration
eval $(gpg-connect-agent --quiet /bye)
export GPG_TTY=$(tty)
