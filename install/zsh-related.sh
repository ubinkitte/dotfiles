#!/bin/sh
set -eu

DOTFILES="$HOME/dotfiles/common"

for file in .zshrc .zsh_aliases .zsh_exports .zprofile .zshenv; do
    ln -sf "$DOTFILES/$file" "$HOME/$file"
done

mkdir -p "$HOME/.config"

if [ ! -e "$HOME/.config/mise" ] &&
   [ ! -L "$HOME/.config/mise" ]; then
    ln -s "$DOTFILES/.config/mise" "$HOME/.config/mise"
fi

if ! command -v mise >/dev/null 2>&1 &&
   [ ! -x "$HOME/.local/bin/mise" ]; then
    curl -fsSL https://mise.run | sh
fi

if command -v mise >/dev/null 2>&1; then
    mise install
fi
