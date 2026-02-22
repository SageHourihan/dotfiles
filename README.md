# Sage's Dotfiles

Dotfiles for Ubuntu (Multipass) VMs.

---

## Installation

```bash
git clone https://github.com/SageHourihan/dotfiles
cd dotfiles
chmod +x install.sh
./install.sh ~
```

`install.sh` will:
- Symlink all dotfiles into `$HOME` (`.bashrc`, `.aliases`, `.bash_profile`, etc.)
- Symlink `nvim/` to `~/.config/nvim`
- Run `tools.sh` to install dependencies

`tools.sh` installs:
- `nvim` via `snap install nvim --classic`
- `node` via `snap install node --classic`

After installing, reload your shell:

```bash
source ~/.bashrc
```

---

## Neovim

Uses **Lazy.nvim** as the plugin manager with an `init.lua` config.

On first launch, Lazy will automatically bootstrap itself and install all plugins. No manual setup needed.

See [`NVIM_CHEATSHEET.md`](./NVIM_CHEATSHEET.md) for keybindings and plugin usage.

**Useful commands inside nvim:**

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Update all plugins |
| `:Mason` | Open LSP server manager |

---

## Cheatsheets

| File | Contents |
|------|----------|
| [`NVIM_CHEATSHEET.md`](./NVIM_CHEATSHEET.md) | Neovim keybindings, LSP, Telescope, plugins |
| [`SHELL_CHEATSHEET.md`](./SHELL_CHEATSHEET.md) | Shell aliases and functions |
| [`TMUX_CHEATSHEET.md`](./TMUX_CHEATSHEET.md) | Tmux panes, windows, sessions |
