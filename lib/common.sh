#!/usr/bin/env bash
# Shared functions for all dotfiles installers

# ── Colors ────────────────────────────────────────────────────────────────────
if tput setaf 1 &>/dev/null; then
    RED=$(tput bold && tput setaf 1)
    GREEN=$(tput bold && tput setaf 2)
    YELLOW=$(tput bold && tput setaf 3)
    BLUE=$(tput bold && tput setaf 4)
    NC=$(tput sgr0)
else
    RED="\e[1;31m"
    GREEN="\e[1;32m"
    YELLOW="\e[1;33m"
    BLUE="\e[1;34m"
    NC="\e[0m"
fi

info()    { echo -e "${BLUE}${1}${NC}"; }
success() { echo -e "${GREEN}${1}${NC}"; }
warn()    { echo -e "${YELLOW}${1}${NC}"; }
error()   { echo -e "${RED}${1}${NC}"; }

# ── Utilities ─────────────────────────────────────────────────────────────────
has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

# Back up a real file (not a symlink) before overwriting it
backup_file() {
    local target="$1"
    local backup_dir="$HOME/.dotfiles_backup/$(date +%Y-%m-%d)"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mkdir -p "$backup_dir"
        mv "$target" "$backup_dir/"
        warn "  Backed up $(basename "$target") → $backup_dir/"
    fi
}

# Safely create a symlink, backing up any real file that exists at the target
safe_symlink() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$src" ]; then
        error "  Source not found: $src"
        return 1
    fi

    backup_file "$dest"
    ln -sf "$src" "$dest"
    success "  Linked $(basename "$src") → $dest"
}
