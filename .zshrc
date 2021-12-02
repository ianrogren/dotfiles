HOME=${HOME:-/Users/ian}

export PATH=$HOME/usr/local/Cellar:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.platformsh/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/php@7.3/bin:$PATH
export PATH=/usr/local/opt/php@7.3/sbin:$PATH

export ZSH=$HOME/.oh-my-zsh
export TASKRC=$HOME/.dotfiles/.taskrc

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(dirname $(gem which colorls))/tab_complete.sh

eval "$(rbenv init -)"

autoload -U compinit && compinit

# Dotfiles
if [ -f $HOME/.dotfiles/.profile ]; then
    . $HOME/.dotfiles/.profile
fi

# Platform
if [ -f $HOME/.platformsh/shell-config.rc ]; then
    . $HOME/.platformsh/shell-config.rc;
fi
