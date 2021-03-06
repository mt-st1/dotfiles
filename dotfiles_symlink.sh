#!/usr/bin/env bash
set -u

DIR="$(cd "$(dirname $0)" && pwd)"
cd "$DIR"

link_dotfiles() {
  local files=(
    .ctags
    .gitconfig
    .gitignore_global
    .gitmessage.txt
    .ideavimrc
    .tmux.conf
    .vimrc
    .zshrc
    .zpreztorc
    .peco/config.json
    .config/nvim/init.vim
    .config/nvim/dein.toml
    .config/nvim/dein_lazy.toml
    .config/tmux/get_battery_tmux.sh
    .zprezto/modules/prompt/functions/prompt_mypure_setup
    .zsh-vimode-visual.zsh
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
  link_dotfiles
}

run
