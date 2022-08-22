# Global SSH Configuration
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Global GPG Configuration. Start a session daemon if needed
eval $(gpg-agent --daemon > /dev/null 2>&1)
eval $(gpg-connect-agent --quiet /bye)
export GPG_TTY=$(tty)

# printf "%s\\n" "🔑  Keys and Agents loaded"
