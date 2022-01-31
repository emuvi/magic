FROM archlinux:base-devel
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Su

RUN pacman --noconfirm -S tmux fish curl git
RUN mkdir -p /root/.config/fish
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/shell/.fishrc -o /root/.config/fish/config.fish
RUN chsh -s /usr/bin/fish

RUN pacman --noconfirm -S nano neovim ranger
