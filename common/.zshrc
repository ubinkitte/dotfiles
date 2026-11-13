setopt globdots

# Zinit (auto-install)
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
    mkdir -p "${ZINIT_HOME:h}"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# Tools
(( $+commands[mise] )) && eval "$(mise activate zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[direnv])) && eval "$(direnv hook zsh)"
(( $+commands[fzf] )) && source <(fzf --zsh)

# User configuration
[[ -r "$HOME/.zsh_exports" ]] && source "$HOME/.zsh_exports"
[[ -r "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}'"

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

bindkey -e

## Option + Left / Right
bindkey -M emacs '^[[1;3D' backward-word
bindkey -M emacs '^[[1;3C' forward-word

## ESC + b / f 形式にも対応
bindkey -M emacs '^[b' backward-word
bindkey -M emacs '^[f' forward-word
export WORDCHARS=''

HISTFILE=~/.zsh_history
HISTSIZE=120000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Plugins and completion
zinit light zsh-users/zsh-completions
zinit snippet OMZP::git
zinit light zsh-users/zsh-autosuggestions

autoload -Uz compinit
compinit
zinit cdreplay -q

# Syntax highlighting should be loaded last.
zinit light zdharma-continuum/fast-syntax-highlighting
