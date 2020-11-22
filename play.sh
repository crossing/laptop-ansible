#!/usr/bin/env bash

set -euo pipefail

THISDIR=$(cd $(dirname $0); pwd)
DISTRO=$(awk -F= '/^NAME/{print tolower($2)}' /etc/os-release | tr -d '"')

sudo sh "$THISDIR/setup/$DISTRO.sh"
. "$THISDIR/setup/ansible.sh"

ansible-playbook "$THISDIR/main.yml" -i localhost, -c local -b $@
