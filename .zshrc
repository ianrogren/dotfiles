export ZSH="/home/ian/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

if [ -f ~/dotfiles/.profile ]; then
    . ~/dotfiles/.profile
fi
