#!/bin/sh
set -e

# check if "piral" is in the command
if [ "$1" = 'piral' ]; then
    # start the command as is and add parameters from the environment variables
    exec dumb-init -- "$@" --port $PORT
fi

# else default to run whatever the user wanted like "bash" or "sh"
exec "$@"