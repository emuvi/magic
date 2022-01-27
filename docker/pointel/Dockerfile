FROM alpine:edge
ENV TERM xterm-256color
RUN apk update
RUN apk upgrade
RUN apk add ranger
RUN apk add neovim
ENV EDITOR nvim
RUN apk add curl
RUN apk add git
RUN apk add openssl-dev
RUN apk add rust
RUN apk add cargo
ENV PATH=/root/.cargo/bin:$PATH
RUN apk add nodejs
RUN apk add npm
RUN npm i -g typescript
WORKDIR "/root"
