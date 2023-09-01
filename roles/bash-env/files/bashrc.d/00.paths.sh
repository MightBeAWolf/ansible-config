
# Iterate over prospective PATH additions and add them if they exist
prospective_path_additions=(
  "${HOME}/.local/bin"
)
for dir in "${prospective_path_additions[@]}"; do
  if [[ -d "$dir" ]]; then
    export PATH="${PATH}:${dir}"
  fi
done
