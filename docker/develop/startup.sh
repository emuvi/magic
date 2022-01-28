#!/bin/bash

cd /root

# rm -rf .cache
# rm -rf .config
# rm -rf .local
# rm -rf .cargo
# rm -rf .rustup
# rm -rf .npm
# rm -rf .nvm
# rm .gitconfig
# rm .bashrc
# rm .profile
# rm clone.liz
# rm fetch.liz
# rm tasked.liz
# rm update.liz
# rm pull.liz
# rm push.liz 

curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir .config
cd .config
mkdir nvim
cd nvim
ln -s /root/Code/cmds/magic/docker/pointel/init.vim

nvim +"PlugInstall --sync" +qa

cd /root
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh
chmod a+x rustup-init.sh
./rustup-init.sh -y
rm rustup-init.sh
rm .bashrc
mv .profile .bashrc
source .bashrc
rustup component add rls
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh -o nvm-init.sh
chmod a+x nvm-init.sh
./nvm-init.sh -y
source .bashrc
nvm install lts

cargo install liz
ln -s Code/cmds/magic/git/.gitconfig
ln -s Code/cmds/magic/develop/clone.liz
ln -s Code/cmds/magic/develop/fetch.liz
ln -s Code/cmds/magic/develop/tasked.liz
ln -s Code/cmds/magic/develop/update.liz
ln -s Code/cmds/magic/prototype/pull.liz
ln -s Code/cmds/magic/prototype/push.liz
