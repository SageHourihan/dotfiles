#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# if parameter does not = 1 print and exit
if [ "$#" -ne 1 ]; then
    RED "Usage: install.sh <home_directory>"
    exit
fi

# testing if root
if [ $UID -ne 0 ]; then
    RED "You must run this script as root!" && echo
    exit
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases tmux.conf"

# change to the dotfiles directory
BLUE "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
GREEN "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    BLUE "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

#run the tools script
./tools.sh

