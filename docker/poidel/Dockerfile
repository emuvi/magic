FROM archlinux:base-devel
ENV TERM xterm-256color
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S zip unzip tmux fish curl git
RUN mkdir -p /root/.config/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/fish/config.fish -o /root/.config/fish/config.fish
RUN chsh -s /usr/bin/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/git/.gitconfig -o /root/.gitconfig

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

RUN /bin/sh -c pacman --noconfirm -S ranger neovim nano

RUN /bin/sh -c pacman --noconfirm -S autoconf automake pkgconf
RUN /bin/sh -c pacman --noconfirm -S ca-certificates openssl
RUN /bin/sh -c pacman --noconfirm -S dos2unix clang cmake

RUN /bin/sh -c pacman --noconfirm -S rustup
RUN /bin/sh -c rustup install stable
RUN /bin/sh -c rustup component add rls rust-analysis rust-src

RUN /bin/sh -c pacman --noconfirm -S nodejs npm
RUN /bin/sh -c npm install --global typescript browserify
RUN /bin/sh -c curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/npm/.npmrc -o /root/.npmrc

RUN /bin/sh -c mkdir -p /root/.config/ranger
RUN /bin/sh -c curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/ranger/rifle.conf -o /root/.config/ranger/rifle.conf
RUN /bin/sh -c curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/ranger/commands.py -o /root/.config/ranger/commands.py
ENV EDITOR=nvim

RUN /bin/sh -c mkdir -p /root/.config/nvim
RUN /bin/sh -c curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/nvim/init.vim -o /root/.config/nvim/init.vim
RUN /bin/sh -c curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN /bin/sh -c nvim +"PlugInstall --sync" +qa
RUN /bin/sh -c nvim -c 'CocInstall -sync coc-docker coc-git coc-clangd coc-cmake coc-rls coc-tsserver coc-json coc-css coc-html coc-phpls coc-markdownlint|qa'

RUN mkdir /Devs
WORKDIR "/Devs"
