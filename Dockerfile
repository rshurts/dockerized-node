FROM node:8.11.3

# Setup applicaton, install dependencies, and build.
WORKDIR /app
COPY package.json /app
COPY yarn.lock /app
RUN yarn install
COPY . /app
COPY cmd.sh /

EXPOSE 3000

# Use non-root user to execute application and tests.
USER node

# Set node environment to production.
# Perform after `yarn install` or dev dependencies won't install which breaks tests.
ENV NODE_ENV production

CMD ["/cmd.sh"]
