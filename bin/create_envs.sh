#!/bin/bash

config_dirs=(
    "alacritty"
    "labwc"
    "swaylock"
    "waybar"
    "nvim"
)

for name in "${config_dirs[@]}"; do
    src="$HOME/dotfiles/.config/$name"
    dest="$HOME/.config/$name"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "$dest already exists!"
    else
        ln -s "$src" "$dest"
        echo "Created: $dest -> $src"
    fi
done
