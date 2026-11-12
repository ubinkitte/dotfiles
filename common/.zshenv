# Locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
case "$OSTYPE" in
  linux*)
    [[ "$LC_CTYPE" == UTF-8 ]] && unset LC_CTYPE
    ;;
esac

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1

# fzf
if [[ -x "$HOME/.fzf/bin/fzf" ]]; then
    export PATH="$PATH:$HOME/.fzf/bin"
fi

# User binaries
export PATH="$HOME/.local/bin:$PATH"

# Rust
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# Added by Antigravity CLI installer
export PATH="/Users/ubinkitte/.local/bin:$PATH"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
