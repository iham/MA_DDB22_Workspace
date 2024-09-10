# This Dockerfile is based on code-server
# https://github.com/coder/code-server/blob/main/ci/release-image/Dockerfile
# and on bits vscode-workspace
# https://hub.docker.com/r/bitcli/vscode-workspace

# bitcli/vscode-workspace is somewhat outdated (OS, BVM, Node, NPM)
# and does not use the offcial Node Container .
 
# This image will be based on the current Node LTS (Iron) Container, that BIT supports and
# has Debian 12.7, Node 20.17.0 and NPM 10.8.2
ARG BASE=node:lts-iron
FROM $BASE

CMD ["bash"]
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y \
    dumb-init \
    git-lfs \
    htop \
    locales \
    lsb-release \
    man-db \
    nano \
    sudo \
    vim-tiny \
    wget \
    zsh \
    && git lfs install \
    && rm -rf /var/lib/apt/lists/*

# https://wiki.debian.org/Locale#Manually
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen \
    && locale-gen
ENV LANG=en_US.UTF-8

RUN adduser --gecos '' --disabled-password coder \
    && echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

RUN ARCH="$(dpkg --print-architecture)" \
    && curl -fsSL "https://github.com/boxboat/fixuid/releases/download/v0.6.0/fixuid-0.6.0-linux-$ARCH.tar.gz" | tar -C /usr/local/bin -xzf - \
    && chown root:root /usr/local/bin/fixuid \
    && chmod 4755 /usr/local/bin/fixuid \
    && mkdir -p /etc/fixuid \
    && printf "user: coder\ngroup: coder\n" > /etc/fixuid/config.yml

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# get latest vs code deb based on architecture and install it
RUN ARCH="$(dpkg --print-architecture)" \
    && eval wget $(curl -s "https://api.github.com/repos/coder/code-server/releases/latest" | grep "browser_download_url" | grep "$ARCH.deb" | cut -d : -f 2,3) -P /tmp \
    && dpkg -i /tmp/code-server*$ARCH.deb

# Allow users to have scripts run on container startup to prepare workspace.
# https://github.com/coder/code-server/issues/5177
ENV ENTRYPOINTD=/entrypoint.d

EXPOSE 8080

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]

# This way, if someone sets $DOCKER_USER, docker-exec will still work as
# the uid will remain the same. note: only relevant if -u isn't passed to
# docker-run.
USER 1000
ARG USER=node
ENV USER=$USER
WORKDIR /home/$USER

# Bit specific vs code extensions
RUN code-server --install-extension=bit.vscode-bit --auth=none

# Prepare for global npm package intallations
ENV NPM_CONFIG_PREFIX="/home/${USER}/.npm-global"
ENV PATH="$PATH:${NPM_CONFIG_PREFIX}/bin:/home/${USER}/bin"

# install BIT related
# By not setting to nightly builts, we get the latest stable versions of bit
# RUN bvm config set RELEASE_TYPE nightly
ENV BIT_GLOBALS_DIR=/tmp/bit
RUN npm install -g npm@10.8.3 @teambit/bvm \
    && bvm upgrade --use-system-node \
    && echo "export PATH=$PATH:${PATH}" >> .profile

RUN bit config set analytics_reporting false \
    && bit config set no_warnings false  \ 
    && bit config set interactive false  \
    && bit config set error_reporting true
