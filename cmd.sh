#!/bin/sh
set -e

if [ "$NODE_ENV" = 'development' ]; then
  exec yarn dev
elif [ "$NODE_ENV" = 'test' ]; then
  exec yarn test
else
  exec node src/server.js
fi
