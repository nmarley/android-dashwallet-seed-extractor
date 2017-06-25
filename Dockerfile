FROM ubuntu:rolling
MAINTAINER BlackCarrot <dev@blackcarrot.be>
LABEL description="DashWallet for Android Backup Mnemonic Seed Recovery"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git build-essential curl python
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs
# RUN rm -fr /var/cache/apt/*

WORKDIR /app
COPY . /app/
RUN npm i
COPY index.html wallet.proto webpack.config.js testo.js /app/
COPY ./test /app/test/
COPY ./src /app/src/

# RUN npm run build
VOLUME /app/dist

RUN /bin/echo set -o vi >> /etc/profile
# CMD ["/bin/bash", "--rcfile", "/etc/profile"]
CMD ["/usr/bin/npm", "run", "build"]
