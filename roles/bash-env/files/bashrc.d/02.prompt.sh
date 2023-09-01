# Enable starship prompt for bash, if available
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
else
  # Load custom prompt as a fallback, if available
  if [[ -f "${HOME}/.bash_prompt" ]]; then
    source "${HOME}/.bash_prompt" || print_error "Failed to load .bash_prompt."
  fi
fi
