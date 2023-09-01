# Enable thefuck command correction utility, if available
if command -v thefuck >/dev/null 2>&1; then
  eval $(thefuck --alias)
else
  print_error "TheFuck command not found."
fi
