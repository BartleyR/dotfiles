#!/bin/sh

# Initialize variables
$PATH_TO_PROJECTS = "$HOME/Projects"

# Create initial directories
directories () {
	echo "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
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