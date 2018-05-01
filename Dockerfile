FROM node:8.11.1

# Setup applicaton, install dependencies, and build.
WORKDIR /app
COPY package.json /app
COPY yarn.lock /app
RUN yarn install
COPY . /app
COPY cmd.sh /

EXPOSE 3000

# Use non-root user to execute application and tests.
ENV HOME /home/nodejs

RUN groupadd -r nodejs \
&& useradd -r -g nodejs nodejs \
&& mkdir -p $HOME \
&& chown nodejs:nodejs $HOME

USER nodejs

# Set node environment to production.
# Perform after `yarn install` or dev dependencies won't install which breaks tests.
ENV NODE_ENV production

CMD ["/cmd.sh"]
