#!/bin/bash

if ! command -v ansible; then
	sudo apt update
	sudo apt install -y ansible git python3
fi

ansible-playbook -i hosts.ini setup.yml -K
