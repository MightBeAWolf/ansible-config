# Initialize the keychain, if available
if command -v keychain >/dev/null 2>&1; then
  eval $(keychain --eval --nogui --noask --quiet \
    --dir "${HOME}/.local/keychain" \
    "$(find ~/.ssh -name 'id_*' ! -name '*.pub')" \
  ) || print_error "Keychain initialization failed."
else
  print_error "Keychain command not found."
fi
