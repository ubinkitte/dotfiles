# Locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

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
