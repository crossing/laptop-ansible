#!/usr/bin/env bash

set -euo pipefail

THISDIR=$(cd $(dirname $0); pwd)

DISTRO=$(awk -F= '/^NAME/{print tolower($2)}' /etc/os-release | tr -d '"')
. "$THISDIR/setup/$DISTRO.sh"

ansible-playbook "$THISDIR/main.yml" -i localhost, -c local -b $@
