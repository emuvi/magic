#!/bin/bash
rm ~/.gitconfig
ln -s ~/Devs/Code/cmds/magic/git/.gitconfig ~/.gitconfig
mkdir -p  ~/.config/fish
rm ~/.config/fish/config.fish
ln -s ~/Devs/Code/cmds/magic/fish/config.fish ~/.config/fish/config.fish
rm ~/.npmrc
cp ~/Devs/Code/cmds/magic/npm/.npmrc ~/.npmrc
rm ~/.tmux.conf
ln -s ~/Devs/Code/cmds/magic/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/ranger
rm ~/.config/ranger/rifle.conf
rm ~/.config/ranger/commands.py
ln -s ~/Devs/Code/cmds/magic/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -s ~/Devs/Code/cmds/magic/ranger/commands.py ~/.config/ranger/commands.py
mkdir -p ~/.config/nvim
rm ~/.config/nvim/init.vim
ln -s ~/Devs/Code/cmds/magic/nvim/init.vim ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +"PlugInstall --sync" +qa
nvim -c 'CocInstall -sync coc-explorer coc-docker coc-git coc-clangd coc-cmake coc-rls coc-tsserver coc-json coc-css coc-html coc-phpls|qa'
rm ~/.emacs
ln -s ~/Devs/Code/cmds/magic/emacs/.emacs ~/.emacs
