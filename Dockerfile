FROM ubuntu:bionic
WORKDIR /app
RUN apt-get -qq update \
  && apt-get -qq install bzip2 python2.7 nodejs npm sudo git \
  && npm i -g -q @bigcommerce/stencil-cli \
  && useradd nodejs \
  && mkdir -p /etc/sudoers.d \
  && echo "nodejs   ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/10-nodejs \
  && chown nodejs:nodejs /app
USER nodejs
RUN sudo mkdir -p /home/nodejs \
  && sudo chown -R nodejs:nodejs /home/nodejs

