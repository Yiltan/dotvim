#!/bin/bash
set -euo pipefail

# Always operate relative to this script's location, regardless of cwd
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

# Link .vimrc in this repo to home
ln -sf "$script_dir/vimrc" ~/.vimrc

# install vim-plug
git submodule update --init --recursive
(cd plugged/vim-plug && git checkout 0.10.0) # current version as of 2018/11/05
mkdir -p autoload
ln -sf "$script_dir/plugged/vim-plug/plug.vim" ~/.vim/autoload/plug.vim
vim +silent +VimEnter +PlugInstall +qall # install plugins

# Add Colours
mkdir -p colors
ln -sf "$script_dir/plugged/vim-monokai/colors/monokai.vim" ~/.vim/colors/monokai.vim

# Update bashrc with my changes
marker="# >>> dotvim bashrc <<<"
if ! grep -qF "$marker" ~/.bashrc 2>/dev/null; then
  {
    echo "$marker"
    cat "$script_dir/bashrc"
  } >> ~/.bashrc
else
  echo "Note: dotvim bashrc block already present in ~/.bashrc, skipping"
fi

path_line="export PATH=$script_dir/bin/:\$PATH"
if ! grep -qF "$path_line" ~/.bashrc 2>/dev/null; then
  echo "$path_line" >> ~/.bashrc
else
  echo "Note: PATH export already present in ~/.bashrc, skipping"
fi
