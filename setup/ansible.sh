#!/usr/bin/env bash

THISDIR=$(cd $(dirname $0); pwd)

if [ ! -f /etc/profile.d/nix.sh ]; then
  echo "Nix is not installed. Bail out."
  exit 1;
fi

source /etc/profile.d/nix.sh
ansible-playbook() {
  cmd="ansible-playbook $@"
  echo $cmd;

  nix-shell --run "$cmd"
}
