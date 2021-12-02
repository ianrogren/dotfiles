# Search
alias llf='ll | grep -i'

# Git Aliases
alias gfc='git fetch && git checkout'

# Neovim
alias v='nvim'

# Clear
alias c='clear'

# Config - Git bare of home directory
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'

# Tmux
alias tm='tmux -f ~/.tmux.config'

# Update Brew Bundle
alias update-bundle='sh ~/.dotfiles/scripts/update-bundle.sh'

# Bitbucket ssh
alias bit='eval `ssh-agent -s` && ssh-add ~/.ssh/bitbucket'

# Varian.com Update database aliases
alias masterdb='scp database.sql.gz uhm6qb4pamz66-master-7rqtwti--app@ssh.us-2.platform.sh:/tmp'
alias stagingdb='scp database.sql.gz 1.ent-uhm6qb4pamz66-staging-5em2ouy@ssh.us-2.platform.sh:/tmp'

# Drupal Code Sniffer
alias drupalcs="phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,info' --ignore='node_modules,bower_components,vendor'"
alias drupalcsp="phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias drupalcbf="phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"

# Drupal Lando Aliases
alias lcs="lando phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,info' --ignore='node_modules,bower_components,vendor'"
alias lcsp="lando phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias lcbf="lando phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme' --ignore='node_modules,bower_components,vendor'"
alias lcr="lando drush cr"
alias xcheck='lando ssh -c "cat /tmp/xdebug.log"'
alias dblogin='lando mysql --host=database --port=3306 --user=drupal8 --password=drupal8 --database=drupal8'

# List aliases using ruby colorls
alias ls='colorls -h --group-directories-first -1'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

