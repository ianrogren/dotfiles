#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
BOLD='\033[0;1m'
NC='\033[0m'

# Setup Folder Permissions
setupFolderPermissions () {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up folder permissions... ${NC}\\n"
	if [ -f /usr/local/share ]; then
		sudo chmod -R 755 /usr/local/share
	fi
}

# Setup ZSH Theme
setupZshTheme() {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up zsh spaceship theme... ${NC}\\n"
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

# Setup rbenv
setupRbenv() {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up rbenv... ${NC}\\n"
	rbenv install 2.6.0
	rbenv global 2.6.0
}

# Setup Colorls
setupColorls() {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up colorls... ${NC}\\n"
	sudo gem install colorls
}

# Setup Plug Install
setupPlugInstall() {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up PlugInstall... ${NC}\\n"
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

setupZshTheme
setupRbenv
setupColorls
setupPlugInstall
setupFolderPermissions