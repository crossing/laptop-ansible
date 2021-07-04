#!/usr/bin/env bash

set -euo pipefail

THISDIR=$(cd $(dirname $0); pwd)

. "$THISDIR/setup/ansible.sh"
ansible-playbook "$THISDIR/main.yml" -i localhost, -c local -e 'ansible_python_interpreter=/usr/bin/python3' -b $@
