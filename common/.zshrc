export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pmcgee"
zstyle ':omz:update' mode reminder
export LANG=en_US

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

if [[ -f "$HOME/.fzf/bin/fzf" ]]; then
export PATH="$PATH:$HOME/.fzf/bin"
fi

source <(fzf --zsh)

alias vi="nvim"

alias de='docker exec -it $(docker ps --format "{{.ID}}\t{{.Image}}\t{{.Names}}" \
  | fzf --header="Select container" \
        --preview="docker inspect {1}" \
        --preview-window=down:60% \
  | awk "{print \$1}") /bin/bash'
