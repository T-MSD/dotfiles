#!/usr/bin/env bash
# Symlink configs from this repo into $HOME. Safe to re-run.
# Existing files/dirs at a target are moved to <target>.bak (or .bak.<timestamp>).
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Directories are linked whole on purpose: the theme script replaces its
# generated files with `mv`, which would break a file-level symlink.
LINKS=(
  "nvim:.config/nvim"
  "ghostty:.config/ghostty"
  "borders:.config/borders"
  "tmux:.config/tmux"
  "tmux/.tmux.conf:.tmux.conf"
  "theme:.config/theme"
  "theme/bin/theme:.local/bin/theme"
  "wezterm/.wezterm.lua:.wezterm.lua"
)

link() {
  local src="$DOTFILES/$1" dst="$HOME/$2"

  [ -e "$src" ] || { echo "missing in repo: $1" >&2; return 1; }

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok       ~/$2"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    local bak="$dst.bak"
    [ -e "$bak" ] || [ -L "$bak" ] && bak="$dst.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$bak"
    echo "backup   ~/$2 -> ${bak#"$HOME"/}"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "linked   ~/$2 -> $1"
}

for entry in "${LINKS[@]}"; do
  link "${entry%%:*}" "${entry#*:}"
done

if [ ! -e "$DOTFILES/theme/current" ] && [ -x "$HOME/.local/bin/theme" ]; then
  echo
  echo "No active theme yet. Generate one with e.g.: theme jellybeans-hc"
fi
