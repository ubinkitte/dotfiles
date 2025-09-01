#!/bin/bash

REPO="https://github.com/NP-F/dotfiles.git"
DEST="$HOME/dotfiles"

sudo apt update

if ! command -v ansible; then
	sudo apt install -y ansible
fi

if ! command -v git; then
	sudo apt install -y git
fi

if ! [ -d "$DEST" ]; then
	git clone "$REPO" "$DEST"
	cd "$DEST"
else
	cd "$DEST"
	git pull
fi

ansible-playbook -i hosts.ini setup.yml -k
