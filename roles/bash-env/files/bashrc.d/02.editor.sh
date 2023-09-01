# Set the default editor based on availability and priority
for editor in helix nvim vim; do
  if command -v $editor >/dev/null 2>&1; then
    export EDITOR=$(command -v $editor)
    export VISUAL=$(command -v $editor)
    break
  fi
done
if [[ -z $EDITOR ]]; then
  print_error "No preferred text editor found. Consider installing one or configuring a different editor."
fi
