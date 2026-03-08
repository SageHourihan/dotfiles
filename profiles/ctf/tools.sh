#!/usr/bin/env bash
# CTF tool installer — Debian/Ubuntu/Kali based systems
# Run via: ./install.sh ctf  (called automatically)
# Or directly: bash profiles/ctf/tools.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$DOTFILES_DIR/lib/common.sh"

# Check we're on Linux with apt
if ! command -v apt &>/dev/null; then
    error "This script requires apt (Debian/Ubuntu/Kali). Aborting."
    exit 1
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
install_pkg() {
    local pkg="$1"
    if dpkg -s "$pkg" &>/dev/null 2>&1; then
        warn "  Already installed: $pkg"
    else
        info "  Installing: $pkg"
        sudo apt install -y "$pkg"
        success "  Installed: $pkg"
    fi
}

# ── Update repos ──────────────────────────────────────────────────────────────
info "\nUpdating package lists..."
sudo apt update

# ── Tool list ─────────────────────────────────────────────────────────────────
info "\nInstalling CTF tools...\n"

# Essentials
TOOLS=(
    # Recon / scanning
    nmap
    masscan
    nikto
    whatweb

    # Web
    gobuster
    sqlmap
    curl
    wget

    # Password cracking
    john
    hashcat
    hydra

    # Exploitation
    metasploit-framework

    # Reverse engineering / binary
    gdb
    ltrace
    strace
    binwalk
    foremost

    # Network
    netcat-openbsd
    tcpdump
    wireshark-common

    # Misc utilities
    python3-pip
    git
    vim
    tmux
    neovim
    seclists
)

for tool in "${TOOLS[@]}"; do
    install_pkg "$tool"
done

# ── Python tools (via pip) ────────────────────────────────────────────────────
info "\nInstalling Python CTF tools..."

PY_TOOLS=(
    pwntools
    requests
    beautifulsoup4
    impacket
)

for pt in "${PY_TOOLS[@]}"; do
    if python3 -c "import ${pt//-/_}" &>/dev/null 2>&1; then
        warn "  Already installed (pip): $pt"
    else
        info "  pip install: $pt"
        pip3 install --quiet "$pt"
        success "  Installed (pip): $pt"
    fi
done

# ── rockyou wordlist ──────────────────────────────────────────────────────────
if [ ! -f /usr/share/wordlists/rockyou.txt ]; then
    if [ -f /usr/share/wordlists/rockyou.txt.gz ]; then
        info "\nExtracting rockyou.txt..."
        sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
        success "rockyou.txt extracted."
    else
        warn "rockyou.txt not found — install 'wordlists' package or extract manually."
    fi
else
    warn "rockyou.txt already present."
fi

echo ""
success "CTF tools installation complete."
