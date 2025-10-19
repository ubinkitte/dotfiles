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


[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

alias vi="nvim"

alias de='docker exec -it $(docker ps --format "{{.ID}}\t{{.Image}}\t{{.Names}}" \
  | fzf --header="Select container" \
        --preview="docker inspect {1}" \
        --preview-window=down:60% \
  | awk "{print \$1}") /bin/bash'
