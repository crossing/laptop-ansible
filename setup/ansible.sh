#!/usr/bin/env bash

mkdir -p $HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin

/usr/bin/python3 -m pip install --user pipx
pipx install ansible --include-deps
