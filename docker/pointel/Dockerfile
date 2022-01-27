FROM alpine:edge
RUN apk update
RUN apk upgrade
RUN apk add curl
RUN apk add git
RUN apk add openssl-dev
RUN apk add rust
RUN apk add cargo
RUN apk add nodejs
RUN apk add npm
RUN apk add neovim
RUN npm i -g typescript
ENV PATH=/root/.cargo/bin:$PATH
ENV TERM xterm-256color
WORKDIR "/root"
