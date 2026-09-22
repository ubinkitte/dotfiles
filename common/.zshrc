if [[ ~/.zshrc -nt ~/.zshrc.zwc ]]; then
  zcompile ~/.zshrc
fi

#ZSH_THEME="pmcgee"
eval "$(starship init zsh)"
zstyle ':omz:update' mode reminder
setopt globdots

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

# import other sources
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# . "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

eval "$(fnm env --use-on-cd --shell zsh)"

# Pi
export PATH="$HOME/.local/share/fnm/node-versions/v24.20.0/installation/bin:$PATH"
