setopt globdots

# Zinit (auto-install)
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
    mkdir -p "${ZINIT_HOME:h}"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-completions

autoload -Uz compinit
compinit

zinit snippet OMZP::git
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Tools
(( $+commands[mise] )) && eval "$(mise activate zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[fzf] )) && source <(fzf --zsh)

# User configuration
[[ -r "$HOME/.zsh_exports" ]] && source "$HOME/.zsh_exports"
[[ -r "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"
