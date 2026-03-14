if [[ ~/.zshrc -nt ~/.zshrc.zwc ]]; then
  zcompile ~/.zshrc
fi

ZSH_THEME="pmcgee"
zstyle ':omz:update' mode reminder
setopt globdots

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

# import other sources
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

