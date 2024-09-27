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

# deal with default command (piral local-feed will be started)
if [ "$1" = 'piral' ]; then
    # if an api key file is passed by docker compose secrets mechanics
    # we override the default keys in PILET_API_KEYS
    if [[ -n "$PIRAL_FEED_SERVICE_API_KEYS_FILE" ]]; then
        export PILET_API_KEYS=$(cat $PIRAL_FEED_SERVICE_API_KEYS_FILE | xargs | sed 's/ /,/g')
    fi
    # otherwise the ENV variable(s) from passing them or defaults are used
    exec dumb-init -- piral local-feed --port $PORT
fi

# else default to run whatever the user wanted like "bash" or "sh" or "ls -la"
exec "$@"