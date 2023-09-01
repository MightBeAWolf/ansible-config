# Set colors for ls, tree, fd, dust using vivid, if available
if command -v vivid >/dev/null 2>&1; then
  export LS_COLORS="$(vivid generate nord)"
else
  print_error "Vivid not found. Falling back to default color settings."
fi
