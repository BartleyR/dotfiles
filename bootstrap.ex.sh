#!/bin/sh

# Initialize variables
$PATH_TO_PROJECTS = "$HOME/Projects"

# Create initial directories
directories () {
	echo "Checking to make sure the $PATH_TO_PROJECTS directory exists"

	if [ ! -d "$PATH_TO_PROJECTS/Projects/" ] ; then
		echo "Making directory $PATH_TO_PROJECTS"
		mkdir -p "$PATH_TO_PROJECTS"
	else
		echo "Directory already exists"
	fi
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link_home() {
	echo "Linking dotfiles from this repo to the home directory"
	echo "Proceed? (y/n)"
	read resp

	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A ./home/ | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
			ln -sv "$PWD/home/$file" "$HOME"
		done
		echo "Symlinking to home directory complete"
	else
		echo "Symlinking to home directory cancelled by user"
		return -1
	fi
}

directories
link_home