# instead of using debian as the base image, using node does the trick
# node:lts-iron is already based on debian 12.7 (bookworm)
FROM node:lts-iron

# increase node process memory
ENV NODE_OPTIONS=--max_old_space_size=4096

RUN apt-get update \
    && apt-get install -y \
    locales \
    git-lfs \
    && git lfs install \
    && rm -rf /var/lib/apt/lists/*

# https://wiki.debian.org/Locale#Manually
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen \
    && locale-gen
ENV LANG=en_US.UTF-8

# update npm and install bvm globally
RUN npm i npm@latest @teambit/bvm -g

# Switching to user node
# this ensures later usage of bit is non root
USER node

# install latest stable bit release
# --use-system-node ensures to not isntall additional Node versions in the users space
RUN bvm upgrade --use-system-node

# add bits own interpretation where to put binaries ...
ENV PATH=$PATH:/home/node/bin

# change bit configurations
RUN bit config set analytics_reporting false \
    && bit config set no_warnings false \
    && bit config set interactive false \
    && bit config set error_reporting true
