FROM node:8.9.4

# Setup applicaton, install dependencies, and build.
WORKDIR /app
COPY package.json /app
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
# Perform after `yarn install` or dev dependencies won't install.
ENV NODE_ENV production

CMD ["/cmd.sh"]
