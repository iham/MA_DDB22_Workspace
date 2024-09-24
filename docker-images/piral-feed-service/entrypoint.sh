#!/bin/sh
set -e

# write env variables to .env file as dotenv and piral can only deal with those and ignore env vars...

# Docker Images should be intuitively used as such:
# docker run <image-name> => starts the default behavior
# docker run -it <image-name> sh/bash or other commands => get into the shell of the container
# docker run <image-name> <cli command> => execute the command (like "ls -la")
# docker run <image-name> <--arg-1> <--arg-2> ... <--arg-n> => starts the default command with arguments
# https://github.com/docker-library/official-images?tab=readme-ov-file#consistency


# Node processes inside Docker Containers have a problem with being killed (SIGTERM)
# Inside a minimalistic containers like this, there is no systemd dealing with signal handling.
# dumb-init fixes that by being a small supervisor for processes.
# The default process is piral, a node process, which needs to be handled by dumb-init.

# deal with arguments on piral
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- dumb-init -- piral local-feed "$@"
fi

# deal with default command (piral local-feed will be startet)
if [ "$1" = 'piral' ]; then
    exec dumb-init -- piral local-feed --api-key $(cat $PIRAL_FEED_SERVICE_API_KEY_FILE) --port $PORT
fi

# else default to run whatever the user wanted like "bash" or "sh" or "ls -la"
exec "$@"