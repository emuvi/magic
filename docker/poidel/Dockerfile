FROM archlinux:base-devel
ENV TERM xterm-256color
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S zip unzip tmux fish curl git
RUN mkdir -p /root/.config/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/fish/config.fish -o /root/.config/fish/config.fish
RUN chsh -s /usr/bin/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poidel/git/.gitconfig -o /root/.gitconfig

RUN pacman --noconfirm -S nano neovim ranger

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

RUN mkdir /Devs
WORKDIR "/Devs"
