#!/usr/bin/env bash
# OS and package manager detection

# Returns: mac | linux | unknown
detect_os() {
    case "$(uname -s)" in
        Darwin) echo "mac" ;;
        Linux)  echo "linux" ;;
        *)      echo "unknown" ;;
    esac
}

# Returns: brew | apt | unknown
detect_pkg_manager() {
    if has_cmd brew; then echo "brew"
    elif has_cmd apt; then echo "apt"
    else echo "unknown"
    fi
}

# Returns the Linux distro ID from /etc/os-release (e.g. ubuntu, debian, kali)
detect_distro() {
    if [ -f /etc/os-release ]; then
        # shellcheck source=/dev/null
        . /etc/os-release
        echo "${ID:-unknown}"
    else
        echo "unknown"
    fi
}
