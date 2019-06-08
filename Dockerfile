FROM python:3.6
WORKDIR /app
RUN apt-get -qq update \
  && apt-get -qq install libbz2-dev git \
  && useradd -m -r nodejs \
  && pip install -q requests \
  && chown nodejs:nodejs /app \
  && curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh \
  && chmod a+x nodesource_setup.sh \
  && ./nodesource_setup.sh \
  && apt-get -qq install nodejs \
  && chown -R nodejs:nodejs /usr/lib/node_modules \
  && chown nodejs:nodejs /usr/bin
USER nodejs
RUN npm i -g -q @bigcommerce/stencil-cli 2>&1 | grep -v WARN
USER root
RUN chown -R root:root /usr/lib/node_modules \
  && chown root:root /usr/bin \
  && rm /app/nodesource_setup.sh \
  && pip install --no-cache-dir -U pip awscli jinja2 pyyaml waddle
