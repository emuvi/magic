FROM debian:bullseye-slim
ENV TERM xterm-256color
RUN mkdir /Devs

RUN apt-get update

RUN apt-get install -y tmux zip unzip curl git

RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/bash/.bashrc -o /root/.bashrc

RUN apt-get install -y fish nano neovim ranger
RUN chsh -s /usr/bin/fish

RUN apt-get install -y build-essential cmake clang clang-tools clangd
RUN apt-get install -y dos2unix file autoconf automake autotools-dev
RUN apt-get install -y pkg-config ca-certificates openssl libssl-dev 

RUN apt-get install -y sqlite3 postgresql-client

RUN apt-get install -y python3 python3-venv python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/py

RUN apt-get install -y php-cli php-pgsql php-sqlite3 composer

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
RUN /root/.cargo/bin/rustup component add rls
ENV PATH=/root/.cargo/bin:$PATH

RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
RUN bash n lts
RUN rm n
RUN npm install --global typescript browserify

RUN curl -L https://github.com/emuvi/liz/releases/download/v0.1.18/lin_64_liz.tar.gz -o /usr/local/bin/liz.tar.gz
RUN tar -xzf /usr/local/bin/liz.tar.gz -C /usr/local/bin
RUN rm /usr/local/bin/liz.tar.gz

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /root/.config/ranger
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/ranger/rifle.conf -o /root/.config/ranger/rifle.conf
RUN mkdir -p /root/.config/nvim
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/vim/init.vim -o /root/.config/nvim/init.vim
RUN nvim +"PlugInstall --sync" +qa
RUN nvim -c 'CocInstall -sync coc-docker coc-git coc-clangd coc-cmake coc-rls coc-tsserver coc-json coc-css coc-html coc-phpls coc-markdownlint|qa'
ENV EDITOR nvim

RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/npm/.npmrc -o /root/.npmrc
RUN curl -L https://raw.githubusercontent.com/emuvi/magic/master/docker/develop/.gitconfig -o /root/.gitconfig

WORKDIR "/Devs"
