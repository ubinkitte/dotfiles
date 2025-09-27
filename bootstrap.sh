#!/usr/bin/env bash
set -e

REPO="https://github.com/NP-F/dotfiles.git"
DEST="$HOME/dotfiles"

# OS 判定
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$(echo "$ID" | tr '[:upper:]' '[:lower:]')
else
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
fi

case "$OS" in
    ubuntu)
        update="sudo apt update"
        repo="sudo add-apt-repository -y universe"
        install="sudo apt install -y"
        ANSIBLE_PKG="ansible"
        ;;
    centos)
        update="sudo dnf -y update"
        repo=""  # 特に追加不要
        install="sudo dnf install -y"
        ANSIBLE_PKG="ansible-core"
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# 実行
eval "$update"
eval "$repo"

if ! command -v ansible >/dev/null 2>&1; then
    eval "$install $ANSIBLE_PKG"
fi

if ! command -v git >/dev/null 2>&1; then
    eval "$install git"
fi

if [ ! -d "$DEST" ]; then
    git clone "$REPO" "$DEST"
else
    cd "$DEST" && git pull
fi

cd "$DEST" && ansible-playbook -i hosts.ini playbook.yml -K
