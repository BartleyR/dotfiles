# Initialize variables
echo ""
echo " >> Sourcing path variables"
source ./config/.exports

# Create initial directories
directories () {
	echo ""
	echo " >> Checking to make sure the $PATH_TO_PROJECTS directory exists"

	if [ ! -d "$PATH_TO_PROJECTS" ] ; then
		echo "    >> Making directory $PATH_TO_PROJECTS"
		mkdir -p "$PATH_TO_PROJECTS"
	else
		echo "    >> Directory already exists"
	fi
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link_home() {
	echo ""
	echo " >> Linking dotfiles from this repo to the home directory"
	read -p " >> Proceed? (y/n) : " resp

	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo ""
		for file in $( ls -A ./$LOC_HOME_FILES/ | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
			if [ $HOME/$file ] ; then
				read -p "    >> $file already exists, overwrite? (y/n) : " resp
				if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
					ln -sfv "$PWD/$LOC_HOME_FILES/$file" "$HOME"
					echo ""
				else
					echo "       >> Did not overwrite $file"
				fi
			else
				ln -sv "$PWD/$LOC_HOME_FILES/$file" "$HOME"
			fi
		done
		echo " >> Symlinking to home directory complete"
	else
		echo ""
		echo " >> Symlinking to home directory cancelled by user"
		return -1
	fi
}

directories
link_home