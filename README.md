# Sage's dotfiles

Personal dotfiles with profile-based installation for mac, linux, and CTF environments.

---

## Installation

**Clone the repo**

```bash
git clone https://github.com/SageHourihan/dotfiles
cd dotfiles
```

**Run the installer**

```bash
./install.sh
```

The installer will auto-detect your OS and prompt you to select a profile:

| Profile | Includes |
|---------|----------|
| `mac`   | aliases, bash, tmux |
| `linux` | aliases, bash, tmux, neovim |
| `ctf`   | linux + CTF tools and aliases |

You can also pass the profile directly to skip the prompt:

```bash
./install.sh mac
./install.sh linux
./install.sh ctf
```

**Reload your shell**

```bash
source ~/.bash_profile
```

---

## Structure

```
dotfiles/
├── base/           # Core dotfiles (bash, aliases, tmux)
├── profiles/
│   ├── mac/        # macOS-specific aliases
│   ├── linux/      # Linux-specific aliases
│   └── ctf/        # CTF tools and aliases
├── config/
│   └── nvim/       # Neovim config
├── lib/
│   ├── common.sh   # Shared installer functions
│   └── detect.sh   # OS detection
└── install.sh      # Installer
```

---

## Private Aliases

Sensitive or machine-specific aliases can be stored in `~/.aliases.private` (see `aliases.private.example`). This file is gitignored and sourced automatically.
