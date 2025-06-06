#!/bin/bash
source "$(realpath "${BASH_SOURCE[0]}" | xargs -I{} dirname {})/secrets.env"

export ANSIBLE_FORCE_COLOR=True

# The first argument is the target, the rest are options for the specified target
TARGET=$1
shift # Remove the first argument, leaving any additional arguments

get_latest_python() {
  compgen -c python \
    | grep -E 'python[0-9\.]*$' \
    | sort -uV \
    | tail -n 1
}

# Function to run an ansible playbook
setup() {
	$(get_latest_python) -m venv .venv
	source .venv/bin/activate
	pip install --upgrade pip
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml
}

# Function to run an ansible playbook
ansible_playbook() {
  source .venv/bin/activate
  op run -- ansible-playbook "$@"
}


# Usage function to display help for the script
usage() {
  echo "Usage: $0 {setup|ansible-playbook} [options]"
  echo "Mimics the functionality of a Makefile for Terraform."
}
# Main case switch for the script
case "$TARGET" in
  setup)
    setup "$@"
  ;;
  ansible-playbook)
    ansible_playbook "$@"
  ;;
  *)
    echo "Error: Unknown target '$TARGET'"
    usage
    exit 1
  ;;
esac

