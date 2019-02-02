FROM centos:7
WORKDIR /app
RUN yum -y -q install epel-release https://centos7.iuscommunity.org/ius-release.rpm \
  && yum -q -y install bzip2 nodejs npm sudo git2u \
  && npm i -g -q @bigcommerce/stencil-cli \
  && adduser nodejs \
  && mkdir -p /etc/sudoers.d \
  && echo "nodejs   ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/10-nodejs \
  && chown nodejs:nodejs /app
USER nodejs
