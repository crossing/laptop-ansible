#!/bin/sh
ansible-playbook "$(dirname "$0")/main.yml" -i localhost, -c local -b
