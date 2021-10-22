#!/bin/bash
#post install script. for tools and apps
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

BLUE "updating repositories..."
sudo apt update

BLUE "installing vim..."
sudo apt install -y vim

BLUE "installing git..."
sudo apt install -y git

BLUE "intsalling openssh-server"
sudo apt install -y openssh-server

BLUE "installing tmux..."
sudo apt install -y tmux

BLUE "installing vbox guest additions and utils..."
sudo apt install -y virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms

BLUE "installing openvpn..."
sudo apt-get install -y openvpn

BLUE "installing nmap..."
sudo apt-get install -y nmap

#todo: add dirb
#todo: add gobuster

BLUE "installing curl..."
sudo apt-get install -y curl

BLUE "installing sqlitebrowser"
sudo apt-get install -y sqlitebrowser

BLUE "installing python..."
sudo apt-get install python

BLUE "installing sqlite..."
sudo apt install -y sqlite

BLUE "installing nikto..."
sudo apt install -y nikto

BLUE "installing hydra..."
sudo apt-get install -y hydra
