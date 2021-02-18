#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
BOLD='\033[0;1m'
NC='\033[0m'


# Setup Homebrew
setupHomebrew() {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up Homebrew ${NC}\\n"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}


# Setup Brewfile
setupBrewfile() {
	if [ -f ~/.dotfiles/Brewfile ]; then
		cp ~/.dotfiles/Brewfile ~/
		if [[ $1 = "work" ]]; then
			echo -e "\\n${BLUE}+++ ${BOLD}Creating work brewfile... ${NC}\\n"
			cat ~/.dotfiles/brewfile-work >> ~/Brewfile
		else
			echo -e "\\n${BLUE}+++ ${BOLD}Creating personal brewfile... ${NC}\\n"
		fi
		echo -e "\\n${BLUE}+++ ${BOLD}Building brew bundle... ${NC}\\n"
	else
		echo -e "\\n${RED}ERROR: ${BOLD}Missing Brewfile. ${NC}\\n"
	fi
}


# Update xcode
updateXcode() {
	echo -e "\\n${BLUE}+++ ${BOLD}Updating Xcode... ${NC}\\n"
	sudo xcode-select --install
}

# Setup Folder Permissions
setupFolderPermissions () {
	echo -e "\\n${BLUE}+++ ${BOLD}Setting up folder permissions... ${NC}\\n"
	if [ -f /usr/local/share ]; then
		sudo chmod -R 755 /usr/local/share
	fi
}

updateXcode
setupHomebrew
setupBrewfile $1

