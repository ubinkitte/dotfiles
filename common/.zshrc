export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pmcgee"
zstyle ':omz:update' mode reminder

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

fzf --zsh

alias vi="nvim"

alias de='docker exec -it $(docker ps --format "{{.ID}}\t{{.Image}}\t{{.Names}}" \
  | fzf --header="Select container" \
        --preview="docker inspect {1}" \
        --preview-window=down:60% \
  | awk "{print \$1}") /bin/bash'
