# Sage's dotfiles

Uploading my dotfiles to a repository.
______
### Installation

**Using Git**

*Note: Make sure you are in the root directory*

`git clone https://github.com/SageHourihan/dotfiles`

Change directory into dotfiles

`cd dotfiles`

Make the install.sh script executable

`chmod +x install.sh`

Run the install script with the tilde(~) as a parameter

`./install.sh ~`

Refresh the .bashrc and .bash_profile

`source .bashrc source .bash_profile source .tmux.conf`

**Neovim Installation and Plugin Management (vim-plug)**

After running the install script, Neovim's configuration will be symlinked to `~/.config/nvim`.

**Installing vim-plug:**
Open neovim and run :PlugInstall
