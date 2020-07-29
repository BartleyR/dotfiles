# Initialize variables
echo ""
echo " >> Sourcing path variables"
source ./config/.exports

# Install Oh My ZSH
oh_my_zsh() {
	echo ""
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo ""
}

# Install Powerlevel9k
# Currently archived. Leaving this here for vis, but switching to Powerlevel10k
powerlevel9k() {
	echo ""
	git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
	echo ""
}

# Install Powerlevel10k
powerlevel10k() {
	echo ""
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo ""
}

# Create initial directories
directories () {
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
	echo " >> Linking dotfiles from this repo to the home directory"
	read -p " >> Proceed? (y/n) : " resp

	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo ""
		for file in $( ls -A ./$LOC_HOME_FILES/ | grep -vE '\.exclude*|\.ex*|\.git$|\.gitignore|.*.md' ) ; do
			if [ -f $HOME/$file ] ; then
				read -p "    >> $file already exists, overwrite? (y/n) : " resp
				if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
					rm "$HOME/$file"
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

# SUmmary post-install information
summary() {
	echo " >> Configuration complete"
	echo " >> The script did not check to ensure Powerline fonts are installed."
	echo " >> Visit https://github.com/powerline/fonts for install information."
	echo " >> If using Powerlevel10k, visit https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k for more info."
	echo ""
	echo " >> If on a Linux system, you can run the command below to install Powerline fonts: "
	echo ""
	echo "     sudo apt install powerline fonts-powerline"
	echo ""
	echo " >> If on a macOS system, you can install the correct fonts by visiting the site: "
	echo ""
	echo "     https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
	echo ""
}

echo ""
echo "Oh My ZSH Installation"
echo "-----------------------------------------------------------------------------------"
if [ ! -d "$HOME/.oh-my-zsh/" ] ; then
	echo " >> Oh My ZSH is not installed at $HOME/.oh-my-zsh"
	read -p " >> Would you like to install Oh My ZSH? (y/n) : " resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		oh_my_zsh
	fi
else
	echo " >> Oh Oh My ZSH is installed at $HOME/.oh-my-zsh."
	echo " >> Skipping install."
fi

echo ""
echo "Powerlevel10k Theme"
echo "-----------------------------------------------------------------------------------"
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/" ] ; then
	echo " >> The Powerlevel10k theme is not installed with Oh My ZSH. You may have it installed elsewhere (not checked)."
	echo " >> The default configuration of this repo requires the Powerlevel10k theme."
	read -p " >> Would you like to install the Powerlevel10k theme for Oh My ZSH? (y/n) : " resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		powerlevel10k
	else
		echo " >> Skipping the Powerlevel10k installation."
	fi
else
	echo " >> The Powerlevel10k theme is already installed for Oh My ZSH."
	echo " >> Skipping install."
fi

echo ""
echo "Checking Directory Structure"
echo "-----------------------------------------------------------------------------------"
directories

echo ""
echo "Symbolinc Linking to Home Directory"
echo "-----------------------------------------------------------------------------------"
link_home

echo ""
echo "Post Bootstrap Summary"
echo "-----------------------------------------------------------------------------------"
summary