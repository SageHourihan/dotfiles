# Shell Cheat Sheet

Aliases and functions loaded from `~/.aliases`.

---

## General

| Alias | Command |
|-------|---------|
| `c` / `cls` | `clear` |
| `h` | `history` |
| `k` | `kill` |
| `q` | `quit` |

---

## Navigation

| Alias | Action |
|-------|--------|
| `home` / `~` | `cd ~` |
| `root` | `cd /` |
| `desktop` | `cd ~/Desktop` |
| `code` | `cd ~/Documents/Code` |
| `..` | Up 1 directory |
| `...` | Up 3 directories |
| `....` | Up 4 directories |

---

## Listing Files

| Alias | Command |
|-------|---------|
| `l` | `ls` |
| `ll` | `ls -l` |
| `la` | `ls -a` |
| `lla` | `ls -la` |

---

## Git

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gaa` | `git add -a` |
| `gcm` | `git commit -m` |
| `gck` | `git checkout` |
| `gsw` | `git switch` |
| `gb` | `git branch` |
| `gm` | `git merge` |
| `gp` | `git push` |
| `gc` | `git clone` |

---

## SSH Service

| Alias | Action |
|-------|--------|
| `ssh-status` | Check SSH service status |
| `ssh-start` | Start SSH service |
| `ssh-stop` | Stop SSH service |
| `ssh-restart` | Restart SSH service |
| `ssh-enable` | Enable SSH on boot |
| `ssh-disable` | Disable SSH on boot |

---

## Neovim

| Alias | Command |
|-------|---------|
| `n` / `nv` / `vi` / `vim` | `nvim` |

---

## Functions

### `mkcd <name>`
Create a directory and immediately `cd` into it.
```bash
mkcd my-project
# equivalent to: mkdir my-project && cd my-project
```

### `rmd <path>`
Recursively delete a file or directory (with sudo).
```bash
rmd old-folder
# equivalent to: sudo rm -r old-folder
```
