FROM archlinux:base
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S curl
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/poibas/bash/.bashrc -o /root/.bashrc
RUN chsh -s /bin/bash