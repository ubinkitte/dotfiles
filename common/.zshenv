# Lang and locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

# ?
export ZSH="$HOME/.oh-my-zsh"

# Tools
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

if [[ -f "$HOME/.fzf/bin/fzf" ]]; then
export PATH="$PATH:$HOME/.fzf/bin"
fi

export PATH="$HOME/.cargo/env:$PATH"
. "$HOME/.cargo/env"
