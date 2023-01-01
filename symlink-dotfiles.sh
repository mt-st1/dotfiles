#!/usr/bin/env bash
set -u

DIR="$(cd "$(dirname $0)" && pwd)"
cd "$DIR"

link-dotfiles() {
  local files=(
    .Brewfile
    .commit_template
    .gitconfig
    .tmux.conf
    .zshrc
    .zsh-prezto-completion.zsh
    .config/starship.toml
    .config/git/ignore
    .config/nvim/plugin
    .config/nvim/init.vim
    .config/nvim/dein.toml
    .config/nvim/dein_lazy.toml
    .config/karabiner/karabiner.json
  )

  for file in ${files[@]}; do
    local src="$DIR/$file"
    local dst="$HOME/$file"

    echo "Creating symlink: $src => $dst"

    local dir="$(dirname $file)"
    local dst_dir="$HOME/$dir"
    [[ ! -d "$dst_dir" ]] && mkdir -p "$dst_dir"

    ln -sf "$src" "$dst"
  done
}

run() {
  link-dotfiles
}

run

