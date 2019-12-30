# BartleyR's dotfiles
<hr />
This is my collection of dotfiles and boostrap scripts that make it easy to sync configurations between computers and set up a new computer.

## Installation
> Note: The `boostrap.ex.sh` script has the potential to overwrite your existing configurations. Please make a backup of your existing dotfiles before you proceed.

To install, open a Terminal window and do the following:

1. Clone this repo: `git clone https://github.com/BartleyR/dotfiles.git`
2. Change directories into the repo: `cd dotfiles`
3. Make any configuration changes necessary in the `config/.exports` file
4. Run the bootstrap script: `sh bootstrap.ex.sh`
5. Restart your terminal

## Configuration Files
- `config/.exports`: Contains configuration paths and variables

## Dotfiles
- `home/.aliases`: Contains aliases that are sourced in `.zshrc`
- `home/.functions`: Contains functions that are sourced in `.zshrc`
- `home/.vimrc`: Configuration file for VIM
- `home/.zshrc`: ZSH configuration file