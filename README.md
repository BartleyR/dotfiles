# Custom dotfiles
This is my collection of dotfiles and boostrap scripts that make it easy to sync configurations between computers and set up a new computer. While most of the customizations will work on any Linux/OS system, they are specifically written for and tested on [macOS](https://www.apple.com/macos/). It can also be used on Linux-based machines with some adjustments to functions that might not produce correct results.

## Installation
> Note: The `boostrap.sh` script has the potential to overwrite your existing configurations. Please make a backup of your existing dotfiles before you proceed.

Before you install, you must have `curl` installed on your machine.

To install, open a terminal window and do the following:

1. Clone this repo: `git clone https://github.com/BartleyR/dotfiles.git`
2. Change directories into the repo: `cd dotfiles`
3. Make any configuration changes necessary in the `config/.exports` file
4. Run the bootstrap script

	```
	# for macOS machines
	sh bootstrap.sh
	
	# for Ubuntu machines
	bash bootstrap.sh
	```
5. Restart your terminal instance

The script now includes the options to install [Oh My ZSH](https://ohmyz.sh) as well as the [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k), but they can also be installed separately. The Powerlevel10k theme highly recommends a [patched font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k), but you can also use [Powerline fonts](https://github.com/powerline/fonts) or a similar font package. More information about requirements is in the section below.

## Requirements
This custom dotfile environment relies on the [Z shell](https://en.wikipedia.org/wiki/Z_shell) (zsh). If you wish to use the Bash shell, you can still use the individual dotfiles and source them in your `.bashrc` file. 

Requirements that can be installed by `bootstrap.sh` (i.e., no need to separately install):

* [Oh My ZSH](https://ohmyz.sh)
* [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k)

Requirements that must be installed separately:

* [Powerline fonts](https://github.com/powerline/fonts): instructions for installation are shown after running `bootstrap.sh`
* For the Powerlevel10k theme, you may optionally install a patched font. [Follow the directions to do this and configure your terminal](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

## Configuration Files
- `config/.exports`: Contains configuration paths and variables
- `config/.exports_local`: [optional] Contains local configuration paths and variables that should not be synced across machines

## Dotfiles
Dotfiles are organized into folders based on where the files live in the OS. For example, files in the `home` folder live inside the `$HOME` directory on the OS.

- `home/.aliases`: Contains aliases that are sourced in `.zshrc`
- `home/.functions`: Contains functions that are sourced in `.zshrc`
- `home/.vimrc`: Configuration file for VIM
- `home/.zshrc`: ZSH configuration file
- `home/.aliases_functions_local`: Optional file that contains local-only aliases and functions
- `home/.zsh_path_exports_local`: Optional file that has local-only path exports

## Local Custom Aliases and Functions [optional]
There may be instances where it's desierable to have some aliases and functions that exist on a single machine or OS type (e.g., only on macOS and not on Ubuntu). To accomplish this, place the local customizations in a file named `.aliases_functions_local` in the `$HOME` directory. An example file is provided in this repo. This file will be sourced via `.zshrc` if it exists.

## Local Path Additions [optional]
Similarly, there may be instances where it's necessary to have some path customization that exists on a single machine or OS type (e.g., a path to Homebrew only on macOS). To accomplish this, place the local path additions in a file named `.zsh_path_exports_local` in the `$HOME` directory. This file will be sourced via `.zshrc` if it exists.

### Example:
To add the path to Homebrew to a single machine (and not have this sync across machines), perform the following:

1. Copy the provided `.zsh_path_exports_local` file to your `$HOME` directory. 

2. Edit the file to include the following:

	```
	typeset -U PATH path
	path=(
	  /opt/homebrew/bin
	  $path
	)
	export PATH
	```

Then either restart your terminal or use `source ~/.zshrc` to make the changes in your current shell.

## Testing
Scripts and configurations have been tested with the following operating systems and terminals.

* [macOS Catalina 10.15.7](https://support.apple.com/en-us/HT210642) - [macOS Tahoe 26.2](https://support.apple.com/en-us/125886)
* [iTerm2 Build 3.6.6](https://iterm2.com)
* [Ubuntu 24.04](https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890)

## References
Inspiration taken from [this GitHub repo](https://github.com/ajmalsiddiqui/dotfiles)
