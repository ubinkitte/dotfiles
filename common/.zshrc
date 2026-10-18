setopt globdots

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
zstyle ':omz:update' mode reminder

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Tools (after OMZ so PATH and prompt are not overwritten)
(( $+commands[mise] )) && eval "$(mise activate zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[fzf] )) && source <(fzf --zsh)

[[ -r "$HOME/.zsh_exports" ]] && source "$HOME/.zsh_exports"
[[ -r "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"
