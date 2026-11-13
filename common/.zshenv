# Locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

case "$OSTYPE" in
    linux*)
        [[ "$LC_CTYPE" == UTF-8 ]] && unset LC_CTYPE
        ;;
esac

# PATH
typeset -U path PATH

# User binaries
path=("$HOME/.local/bin" $path)

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1

# Rust
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Android SDK
case "$OSTYPE" in
    darwin*) sdk_path="$HOME/Library/Android/sdk" ;;
    linux*)  sdk_path="$HOME/Android/Sdk" ;;
    *)       sdk_path="" ;;
esac

if [[ -n "$sdk_path" && -d "$sdk_path" ]]; then
    export ANDROID_HOME="$sdk_path"
    path=("$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools" $path)
fi

unset sdk_path
