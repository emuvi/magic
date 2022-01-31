FROM archlinux:base-devel
ENV TERM xterm-256color
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S zip unzip tmux fish curl git
RUN mkdir -p /root/.config/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/fish/config.fish -o /root/.config/fish/config.fish
RUN chsh -s /usr/bin/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/git/.gitconfig -o /root/.gitconfig

RUN pacman --noconfirm -S autoconf automake pkgconf
RUN pacman --noconfirm -S ca-certificates openssl
RUN pacman --noconfirm -S dos2unix clang cmake

RUN pacman --noconfirm -S sqlite postgresql-libs

RUN pacman --noconfirm -S python python-pip
RUN ln -s /usr/bin/python3 /usr/bin/py

RUN pacman --noconfirm -S php php-pgsql php-sqlite xdebug composer

RUN curl -L https://github.com/emuvi/liz/releases/download/v0.1.18/lin_64_liz.tar.gz -o /usr/local/bin/liz.tar.gz
RUN tar -xzf /usr/local/bin/liz.tar.gz -C /usr/local/bin
RUN rm /usr/local/bin/liz.tar.gz

RUN pacman --noconfirm -S ranger neovim nano

RUN pacman --noconfirm -S autoconf automake pkgconf
RUN pacman --noconfirm -S ca-certificates openssl
RUN pacman --noconfirm -S dos2unix clang cmake

RUN pacman --noconfirm -S rustup
RUN rustup install stable
RUN rustup component add rls rust-analysis rust-src

RUN pacman --noconfirm -S nodejs npm
RUN npm install --global typescript browserify
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/npm/.npmrc -o /root/.npmrc

RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/tmux/tmux.conf -o /root/.tmux.conf

RUN mkdir -p /root/.config/ranger
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/ranger/rifle.conf -o /root/.config/ranger/rifle.conf
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/ranger/commands.py -o /root/.config/ranger/commands.py
ENV EDITOR=nvim

RUN mkdir -p /root/.config/nvim
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinde/nvim/init.vim -o /root/.config/nvim/init.vim
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +"PlugInstall --sync" +qa
RUN nvim -c 'CocInstall -sync coc-docker coc-git coc-clangd coc-cmake coc-rls coc-tsserver coc-json coc-css coc-html coc-phpls|qa'

RUN mkdir /Devs
WORKDIR "/Devs"
