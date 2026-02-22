# Tmux Cheat Sheet

**Prefix key: `` ` `` (backtick)**

---

## Sessions

| Command | Action |
|---------|--------|
| `tmux` | Start new session |
| `tmux new -s name` | Start named session |
| `tmux ls` | List sessions |
| `tmux attach -t name` | Attach to session |
| `prefix + d` | Detach from session |

---

## Windows

| Key | Action |
|-----|--------|
| `prefix + c` | Create new window |
| `prefix + ,` | Rename window |
| `prefix + &` | Kill window |
| `prefix + 0-9` | Switch to window by number |
| `Shift + →` | Next window |
| `Shift + ←` | Previous window |

---

## Panes

| Key | Action |
|-----|--------|
| `prefix + v` | Split vertical (side by side) |
| `prefix + h` | Split horizontal (top/bottom) |
| `prefix + k` | Kill pane (no confirmation) |
| `Alt + ←/→/↑/↓` | Switch between panes |
| `prefix + z` | Zoom pane (toggle fullscreen) |
| `prefix + q` | Show pane numbers |

---

## Config

| Key | Action |
|-----|--------|
| `prefix + r` | Reload `~/.tmux.conf` |

---

## Mouse

Mouse mode is enabled — you can click to switch panes/windows and drag to resize panes.
