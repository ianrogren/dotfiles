DEVICE="macbook" # wsl2 or macbook
export ZSH="$HOME/.oh-my-zsh"

## WLS2
# plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions)


## Macbook
  export PATH="/usr/local/sbin:$PATH"
  source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
  fi

  export PATH="/usr/local/opt/php@7.3/bin:$PATH"
  export PATH="/usr/local/opt/php@7.3/sbin:$PATH"

  eval "$(rbenv init -)"


## ZSH Settings
ZSH_THEME="spaceship"
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

if [ -f ~/.dotfiles/.profile ]; then
    . ~/.dotfiles/.profile
fi

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/ian'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET
