#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
stow -R -d stow -t "$HOME" brew zsh tmux git nvim gh ghostty starship karabiner hammerspoon misc herdr
