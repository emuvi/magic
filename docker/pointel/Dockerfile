FROM alpine:edge
ENV TERM xterm-256color
RUN apk update
RUN apk upgrade
RUN apk add ranger
RUN apk add neovim
ENV EDITOR nvim
RUN apk add curl
RUN apk add git
RUN apk add openssl
RUN apk add openssl-dev
RUN apk add rust
RUN apk add cargo
ENV PATH=/root/.cargo/bin:$PATH
RUN apk add nodejs
RUN apk add npm
RUN npm i -g typescript
RUN npm i -g browserify
RUN apk add sqlite postgresql-client
RUN apk add php7 php7-curl php7-json php7-session php7-openssl php7-xml php7-sqlite3 php7-pgsql php7-zip
RUN ln -s /usr/bin/php7 /usr/bin/php
RUN apk add composer
WORKDIR "/root"