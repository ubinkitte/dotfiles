#!/bin/bash

# This script was created in Lubuntu 24.04 LTS.


# REM: I must update this with using `apt list --installed``
packages=(
    neovim
    build-essential
    zsh

    alacritty
    fcitx5-mozc
    fuzzel
    kdeconnect
    labwc
    pcmanfm
    sway-notification-center
    swaybg
    swayidle
    swaylock
    waybar
    wlogout
)

apt update
apt install -y "${packages[@]}"