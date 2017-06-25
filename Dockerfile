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

RUN /bin/echo set -o vi >> /etc/profile
CMD ["/bin/bash", "--rcfile", "/etc/profile"]
