const http = require("http");

const app = require("./app");

// Normalize a port into a number, string, or false.
function normalize(val) {
  const bind = parseInt(val, 10);
  if (Number.isNaN(bind)) {
    return val; // named pipe
  }
  if (bind >= 0) {
    return bind; // port number
  }
  throw Error("Unable to determine port or pipe.");
}

const port = normalize(process.env.PORT || "3000");

// Event listener for HTTP server "error" event.
function onError(error) {
  // Handle specific listen errors with friendly messages.
  if (error.syscall === "listen") {
    const bind = typeof port === "string" ? `Pipe ${port}` : `Port ${port}`;
    if (error.code === "EACCES") {
      console.error(`Error: ${bind} requires elevated privileges.`);
    }
    if (error.code === "EADDRINUSE") {
      console.error(`Error: ${bind} is already in use.`);
    }
  }
  throw error;
}

// Event listener for HTTP server "listening" event.
function onListening() {
  const addr = this.address();
  const bind = typeof addr === "string" ? `pipe ${addr}` : `port ${addr.port}`;
  console.log(`Listening on ${bind}`);
}

http
  .createServer(app)
  .listen(port)
  .on("error", onError)
  .on("listening", onListening);
