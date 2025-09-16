#!/bin/sh

# 環境変数
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export CLUTTER_IM_MODULE=fcitx

# DBus セッション経由で起動
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

picom &

# fcitx5 デーモン起動
fcitx5 &

# Fluxbox 起動
exec startfluxbox

