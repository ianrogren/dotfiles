# Dotfiles

Personal collection of my dotfiles and configuratons for to get up and running quickly on a macOS:

1. Setup a git bare directory in the home folder by usng following guide: [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) 
1. Pull this git repository.
1. Run `~/.dotfiles/scripts/start-brewing.sh`
1. `cd` to the home directory and run `brew bundle install`
1. Run `~/.dotfiles/scripts/post-brew.sh`
1. Setup ssh keys for github and bitbucket using the following guide: [Setting up a seperate Github and Bitbucket account](https://gist.github.com/rosswd/e1afd2b0b0d515517eac)
