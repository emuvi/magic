FROM archlinux:base-devel
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S tmux fish curl git
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/bash/.bashrc -o /root/.bashrc
RUN chsh -s /usr/bin/fish

RUN pacman --noconfirm -S nano neovim ranger
