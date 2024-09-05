FROM node:20.11.1

# Increase memory to avoid 137 error code
ENV NODE_OPTIONS=--max_old_space_size=4096

# Using Root privileges to update NPM and install bit's version manager (BVM)
RUN <<EOF
    npm install -g npm@10.8.3
    npm i @teambit/bvm -g
EOF

# bit itself will run as User node and is therefore only installed as such
USER node

# Installing bit 1.8.20 using system node to avoid additional NodeJS installations
RUN bvm install 1.8.20 --use-system-node true --skip-update-path true

# BVM installs bit CLI inside the node users home in ~/bin.
# This ~/bin is not in the PATH during Docker Setup (but is during running)
ENV PATH "$PATH:/home/node/bin"

# Setting base configs on bit based on
# https://bit.dev/reference/reference/scope/running-a-scope-server/#docker-images
RUN <<EOF
    bit config set analytics_reporting false
    bit config set no_warnings false
    bit config set interactive false
    bit config set error_reporting true
EOF
