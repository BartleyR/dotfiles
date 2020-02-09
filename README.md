# Custom dotfiles
This is my collection of dotfiles and boostrap scripts that make it easy to sync configurations between computers and set up a new computer. While most of the customizations will work on any Linux/OS system, they are specifically written for and tested on [macOS](https://www.apple.com/macos/). Scripts were most recently tested with macOS [Catalina 10.15.2](https://support.apple.com/en-us/HT210642) and [iTerm2](https://iterm2.com).

## Requirements
This custom dotfile environment relies on the [Z shell](https://en.wikipedia.org/wiki/Z_shell) (zsh). If you wish to use the Bash shell, you can still use the individual dotfiles and source them in your `.bashrc` file. 

Requirements that can be installed by `bootstrap.ex.sh` (i.e., no need to separately install):

* [Oh My ZSH](https://ohmyz.sh)
* [Powerlevel9k theme](https://github.com/Powerlevel9k/powerlevel9k)

Requirements that must be installed separately:

* [Powerline fonts](https://github.com/powerline/fonts): instructions for installation are shown after running `bootstrap.ex.sh`


## Installation
> Note: The `boostrap.ex.sh` script has the potential to overwrite your existing configurations. Please make a backup of your existing dotfiles before you proceed.

To install, open a terminal window and do the following:

1. Clone this repo: `git clone https://github.com/BartleyR/dotfiles.git`
2. Change directories into the repo: `cd dotfiles`
3. Make any configuration changes necessary in the `config/.exports` file
4. Run the bootstrap script: `sh bootstrap.ex.sh`
5. Restart your terminal

The script now includes the options to install [Oh My ZSH](https://ohmyz.sh) as well as the [Powerlevel9k theme](https://github.com/Powerlevel9k/powerlevel9k). These can also be installed separately. The Powerlevel9k theme requires [Powerline fonts](https://github.com/powerline/fonts) or a similar font package. These **are not** installed by the bootstrap script, but the script provides directions for Linux users to install on their own. Complete [installation instructions for Powerline fonts](https://github.com/powerline/fonts) are available for other operating systems.

## Configuration Files
- `config/.exports`: Contains configuration paths and variables
- `config/.exports.local`: [optional] Contains local configuration paths and variables that should not be synced across machines

## Dotfiles
Dotfiles are organized into folders based on where the files live in the OS. For example, files in the `home` folder live inside the `$HOME` directory on the OS.

- `home/.aliases`: Contains aliases that are sourced in `.zshrc`
- `home/.functions`: Contains functions that are sourced in `.zshrc`
- `home/.vimrc`: Configuration file for VIM
- `home/.zshrc`: ZSH configuration file

## Local Custom Aliases and Functions [optional]
There may be instances where it's desierable to have some aliases and functions that exist on a single machine or OS type (e.g., only on macOS and not on Ubuntu). To accomplish this, place the local customizations in a file named `.aliases.local` in the `$HOME` directory. This file will be sourced via `.zshrc` if it exists.

## References
Inspiration taken from [this GitHub repo](https://github.com/ajmalsiddiqui/dotfiles)
