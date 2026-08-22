# Lang and locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

# ?
# export ZSH="$HOME/.oh-my-zsh"

# Tools

if [[ -f "$HOME/.fzf/bin/fzf" ]]; then
export PATH="$PATH:$HOME/.fzf/bin"
fi

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
