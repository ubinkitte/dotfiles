export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pmcgee"
zstyle ':omz:update' mode reminder

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
