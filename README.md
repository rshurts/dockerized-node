# dockerized-node

This is an example of setting up a Node.js app with Docker. The goal is to use the same container for development, testing, and production.

## Development

### Getting Started

1. `yarn install` (not necessary, but helpful for editors that rely on eslint being in `node_modules`.)
1. `docker-compose up`. 
1. `curl localhost:3000` to see it up and running.
1. Change code.

The root directory is mounted into the container and `nodemon` is running. So any changes to the code or packages installed are auto-loaded and reflected in the container. The `docker-compose.yml` can be extended to link to other containers, if needed.

### Commands

- `yarn pretty` to format your code.
- `yarn lint` to lint your code.
- `yarn jest` to run your tests.
- `yarn test` to lint and test your code.

## Testing

Run `docker-compose -f docker-compose.test.yml up` to test things locally in the container or use this in a [Docker Cloud Autobuild](https://docs.docker.com/docker-cloud/builds/automated-build/) or extend the compose file to include other services and run integration tests.

Or, if the container can stand alone, build the container and run the container passing in the `NODE_ENV=test` environment variable, before deploying your container somewhere or running end-to-end tests.
- `docker build -t dockerized-node .`
- `docker run -e NODE_ENV=test dockerized-node`

## Production

The included `Dockerfile` to meant to be production friendly. The `NODE_ENV` environment variable is set to `production` and the user has been changed from root.
