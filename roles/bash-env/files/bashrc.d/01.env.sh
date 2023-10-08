export XDG_CONFIG_HOME="${HOME}/.config"
# Iterate over prospective environment files and source them if they exist
prospective_env_additions=(
  "${HOME}/.cargo/env"
)
for file in "${prospective_env_additions[@]}"; do
  if [[ -f "$file" ]]; then
    source "$file" || print_error "Failed to load ${file}."
  fi
done
