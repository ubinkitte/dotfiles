#!/usr/bin/env bash
set -e

REPO="https://github.com/ubinkitte/dotfiles.git"
DEST="$HOME/dotfiles"

# OS 判定
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$(echo "$ID" | tr '[:upper:]' '[:lower:]')
else
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
fi

case "$OS" in
    ubuntu|zorin|linuxmint) 
        sudo apt update
        sudo add-apt-repository -y universe
        sudo apt install -y git ansible
        ;;
    centos)
        sudo dnf -y update
        sudo dnf install -y git ansible-core ansible-collection-community-general
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Check for git again just in case of a minimal installation
if ! command -v git >/dev/null 2>&1; then
    echo "Git could not be installed. Please install it manually and run this script again."
    exit 1
fi

if [ ! -d "$DEST" ]; then
    git clone "$REPO" "$DEST"
else
    cd "$DEST" && git pull
fi

cd "$DEST" && ansible-playbook -i hosts.ini playbook.yml -K
