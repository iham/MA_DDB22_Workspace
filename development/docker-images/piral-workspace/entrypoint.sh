#!/bin/sh
set -eu

# We do this first to ensure sudo works below when renaming the user.
# Otherwise the current container UID may not exist in the passwd database.
eval "$(fixuid -q)"

if [ "${DOCKER_USER-}" ]; then
  USER="$DOCKER_USER"
  if [ "$DOCKER_USER" != "$(whoami)" ]; then
    echo "$DOCKER_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/nopasswd > /dev/null
    # Unfortunately we cannot change $HOME as we cannot move any bind mounts
    # nor can we bind mount $HOME into a new home as that requires a privileged container.
    sudo usermod -l "$DOCKER_USER" node
    sudo groupmod -n "$DOCKER_USER" node

    sudo sed -i "/node/d" /etc/sudoers.d/nopasswd
  fi
fi

# deal with arguments on code-server
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- dumb-init code-server "$@"
fi

# deal with default command (code-server will be started)
if [ "$1" = 'code-server' ]; then
    exec dumb-init "$@"
fi

exec dumb-init "$@"