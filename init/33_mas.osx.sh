# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if mas command is not installed.
[[ ! "$(type -P mas)" ]] && e_error "MAS commands require mas (via homebrew)" && return 1

# Facebook Messenger
# https://apps.apple.com/us/app/messenger/id1480068668?mt=12
mas install 1480068668

# Slack
# https://apps.apple.com/us/app/slack-for-desktop/id803453959?mt=12
mas install 803453959

# System Monitor (temp gaugues etc)
# https://apps.apple.com/us/app/system-monitor/id423368786?mt=12
mas install 423368786

# Magnet (window manager)
# https://apps.apple.com/us/app/magnet/id441258766?mt=12
mas install 441258766

# Yoink (drag and drop)
# https://apps.apple.com/us/app/yoink-better-drag-and-drop/id457622435?mt=12
mas install 457622435

# Todoist
# https://apps.apple.com/us/app/todoist-to-do-list-tasks/id585829637?mt=12
mas install 585829637
