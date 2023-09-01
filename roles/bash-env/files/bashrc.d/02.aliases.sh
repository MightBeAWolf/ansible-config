# Alias definitions for common commands
if command -v exa >/dev/null 2>&1; then
  alias ls='exa'
fi
alias grep='grep --color=auto'
if command -v dust >/dev/null 2>&1; then
  alias du='dust'
fi
