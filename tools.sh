!#/bin/bash
#post install script. for tools and apps
# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

BLUE "updating repositories..."
sudo apt update

BLUE "installing git..."
sudo apt install -y git

BLUE "intsalling openssh-server"
sudo apt install -y openssh-server

BLUE "installing tmux..."

BLUE "installing vbox guest additions and utils..."
sudo apt install -y virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms

BLUE "installing openvpn..."
sudo apt-get install -y openvpn

BLUE "installing nmap..."
sudo apt-get install -y nmap

BLUE "installing curl..."
sudo apt-get install -y curl

BLUE "installing sqlitebrowser"
sudo apt-get install -y sqlitebrowser

BLUE "installing pip..."
sudo apt-get -y python-pip

BLUE "installing python-requests..."
pip install requests

BLUE "installing sqllite..."
sudo apt install -y sqllite

BLUE "installing nikto..."
sudo apt install -y nikto