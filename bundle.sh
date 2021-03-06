#!/usr/bin/env bash

plugin_names=(
  "mileszs/ack.vim.git"
  "ctrlpvim/ctrlp.vim.git"
  "fatih/molokai.git"
  "scrooloose/nerdcommenter.git"
  "scrooloose/nerdtree.git"
  "joshdick/onedark.vim"
  "godlygeek/tabular.git"
  "SirVer/ultisnips.git"
  "tpope/vim-abolish.git"
  "bling/vim-airline.git"
  "vim-airline/vim-airline-themes.git"
  "altercation/vim-colors-solarized.git"
  "tpope/vim-fugitive.git"
  "fatih/vim-go.git"
  "dgryski/vim-godef"
  "tfnico/vim-gradle"
  "pangloss/vim-javascript.git"
  "tpope/vim-markdown.git"
  "Harenome/vim-mipssyntax.git"
  "rakr/vim-one.git"
  "jpo/vim-railscasts-theme.git"
  "derekwyatt/vim-scala.git"
  "lervag/vimtex.git"
  "majutsushi/tagbar.git"
  "FelikZ/ctrlp-py-matcher.git"
)

for name in "${plugin_names[@]}"
do
  echo "Git cloning $name..."
  git clone "https://github.com/$name"
done

git clone "https://github.com/dracula/vim.git dracula-theme"
git clone "git@github.com:yaojingguo/vim-snippets.git"
git clone "git@github.com:yaojingguo/ir_black.git"
