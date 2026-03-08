#!/usr/bin/env bash
# Dotfiles installer
# Usage: ./install.sh [mac|linux|ctf]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=lib/common.sh
source "$DOTFILES_DIR/lib/common.sh"
# shellcheck source=lib/detect.sh
source "$DOTFILES_DIR/lib/detect.sh"

# ── Profile selection ─────────────────────────────────────────────────────────
select_profile() {
    local detected
    detected="$(detect_os)"

    if [ -n "${1:-}" ]; then
        echo "$1"
        return
    fi

    echo ""
    info "Detected OS: $detected"
    echo ""
    echo "Select a profile to install:"
    echo "  1) mac   — aliases, bash, tmux"
    echo "  2) linux — aliases, bash, tmux, neovim"
    echo "  3) ctf   — linux + CTF tools and aliases"
    echo ""
    read -rp "Choice [1-3]: " choice
    case "$choice" in
        1|mac)   echo "mac" ;;
        2|linux) echo "linux" ;;
        3|ctf)   echo "ctf" ;;
        *)       error "Invalid choice."; exit 1 ;;
    esac
}

# ── Symlink base dotfiles ─────────────────────────────────────────────────────
install_base() {
    info "\nInstalling base dotfiles..."
    local base="$DOTFILES_DIR/base"
    local files=(bash_profile bashrc bash_prompt aliases tmux.conf)
    for f in "${files[@]}"; do
        safe_symlink "$base/.$f" "$HOME/.$f"
    done
}

# ── Symlink profile aliases ───────────────────────────────────────────────────
install_profile_aliases() {
    local profile="$1"
    info "\nInstalling profile aliases ($profile)..."

    local src="$DOTFILES_DIR/profiles/$profile/.aliases.local"
    safe_symlink "$src" "$HOME/.aliases.local"
}

# ── Symlink neovim config ─────────────────────────────────────────────────────
install_nvim() {
    info "\nInstalling neovim config..."
    mkdir -p "$HOME/.config"
    safe_symlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"
}

# ── CTF tools installer ───────────────────────────────────────────────────────
install_ctf_tools() {
    read -rp "Install CTF tools? (requires sudo) [y/N]: " ans
    if [[ "$ans" =~ ^[Yy]$ ]]; then
        bash "$DOTFILES_DIR/profiles/ctf/tools.sh"
    else
        warn "Skipping CTF tool installation."
    fi
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    echo ""
    info "=== Dotfiles Installer ==="

    local profile
    profile="$(select_profile "${1:-}")"
    info "Profile: $profile"

    install_base

    case "$profile" in
        mac)
            install_profile_aliases "mac"
            ;;
        linux)
            install_profile_aliases "linux"
            install_nvim
            ;;
        ctf)
            install_profile_aliases "ctf"
            install_nvim
            install_ctf_tools
            ;;
        *)
            error "Unknown profile: $profile"
            exit 1
            ;;
    esac

    echo ""
    success "Done! Reload your shell:"
    echo "  source ~/.bash_profile"
}

main "${1:-}"
