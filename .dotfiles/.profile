###############################################################################
# Aliases
###############################################################################

# Bitbucket ssh
alias bit='eval `ssh-agent -s` && ssh-add ~/.ssh/bitbucket'

# Drupal Code Sniffer
alias drupalcs="phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,info' --ignore='node_modules,bower_components,vendor'"
alias drupalcsp="phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias drupalcbf="phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"

# Drupal Lando Aliases
alias lcs="lando phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,info' --ignore='node_modules,bower_components,vendor'"
alias lcsp="lando phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias lcbf="lando phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias lcr="lando drush cr"

# Update database aliases
alias masterdb="scp database.sql.gz uhm6qb4pamz66-master-7rqtwti--app@ssh.us-2.platform.sh:/tmp"
alias stagingdb="scp database.sql.gz 1.ent-uhm6qb4pamz66-staging-5em2ouy@ssh.us-2.platform.sh:/tmp"

# Git Aliases
alias gfc="git fetch && git checkout"

# Github Config Webpack
alias webpack:build="cd ~/code/github/webpack-config && npm run build"

# Open VS Code with VD8 project
alias varian='code ~/code/bitbucket/varian-drupal-8'
alias vmsnet='code ~/code/bitbucket/vmsnet-frontend-source'
alias patient='code ~/code/bitbucket/varian-patient-site'

# Lando aliases
alias refresh='cd ~/code/bitbucket/varian-drupal-8 && bash ./scripts/shell/complete-rebuild'
alias xcheck='lando ssh -c "cat /tmp/xdebug.log"'
alias dblogin='lando mysql --host=database --port=3306 --user=drupal8 --password=drupal8 --database=drupal8'

# List Aliases
# Using Ruby colorls
alias ls='colorls -h --group-directories-first -1'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Search
alias llf='ll | grep -i'

# Neovim
alias v='nvim'

# ZSH
alias zhf='bash ~/dotfiles/scripts/zsh-corrupt-history-fix.sh'

# Clear
alias c='clear'

# Config (git)
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'

# Tmux
alias tm='tmux -f ~/.tmux.config'

# Update Brew Bundle
alias update-bundle='sh ~/.dotfiles/scripts/update-bundle.sh'

###############################################################################
# Environment
###############################################################################

source $(dirname $(gem which colorls))/tab_complete.sh

HOME=${HOME:-'/home/ian'}

# Homebrew
export PATH=~/usr/local/Cellar:$PATH

# Composer
export PATH=~/.composer/vendor/bin:$PATH

# Task Warrior
export TASKRC='~/.dotfiles/.taskrc'

# Platform
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then
    . "$HOME/"'.platformsh/shell-config.rc';
fi
