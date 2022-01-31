FROM archlinux:base
ENV TERM xterm-256color
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S zip unzip curl
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/pinba/bash/.bashrc -o /root/.bashrc
RUN chsh -s /bin/bash

RUN pacman --noconfirm -S sqlite postgresql-libs

RUN pacman --noconfirm -S python python-pip
RUN ln -s /usr/bin/python3 /usr/bin/py

RUN pacman --noconfirm -S php php-pgsql php-sqlite

RUN curl -L https://github.com/emuvi/liz/releases/download/v0.1.18/lin_64_liz.tar.gz -o /usr/local/bin/liz.tar.gz
RUN tar -xzf /usr/local/bin/liz.tar.gz -C /usr/local/bin
RUN rm /usr/local/bin/liz.tar.gz

RUN mkdir -p /Devs/Test
WORKDIR "/Devs/Test"