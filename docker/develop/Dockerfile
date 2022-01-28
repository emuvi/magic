FROM debian:bullseye-slim

RUN mkdir /devs
WORKDIR "/devs"
ENV TERM xterm-256color

RUN apt-get update

RUN apt-get install -y zip unzip curl git
RUN apt-get install -y fish nano neovim ranger 

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /root/.config/nvim
RUN ln -s /devs/Code/cmds/magic/vim/init.vim /root/.config/nvim/init.vim
RUN nvim +"PlugInstall --sync" +qa
ENV EDITOR nvim

RUN apt-get install -y build-essential cmake clang clang-tools clangd
RUN apt-get install -y dos2unix pkg-config ca-certificates openssl libssl-dev 
RUN apt-get install -y file autoconf automake autotools-dev libtool xutils-dev

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
RUN npm install --global typescript browserify

