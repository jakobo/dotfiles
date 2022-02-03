paths=(
  ~/.local/bin
  $DOTFILES/bin
  ~/bin
  /usr/local/bin
  $JAVA_HOME
  $ANDROID_HOME/tools/bin
  $ANDROID_HOME/tools
  $ANDROID_HOME/platform-tools
  $PATH
)

export PATH
for p in "${paths[@]}"; do
  [[ -d "$p" ]] && PATH="$p:$(path_remove "$p")"
done
unset p paths
