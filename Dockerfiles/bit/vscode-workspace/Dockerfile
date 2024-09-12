# bitcli/vscode-workspace (https://hub.docker.com/r/bitcli/vscode-workspace) is somewhat outdated (OS, BVM, Node, NPM) and does not use the offcial Node Image.

# For the Proof of Concept this will be changed by implementing the Docker Image based on
# the VS Code Server Image (https://github.com/coder/code-server/blob/main/ci/release-image/Dockerfile)

# This Docker Image will be derived from on the current Node LTS Version (20.17.0 - Iron) Image instead of a basic Debian.
# This image also features the latest Debian (12.7 - Bookworm) and has Node Package Manager installed 

# FROM node:lts-iron
FROM iham/bit-base:latest

# SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y \
    dumb-init \
    sudo \
    && rm -rf /var/lib/apt/lists/*


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

# Bit specific vs code extensions
RUN code-server --install-extension=bit.vscode-bit --auth=none

# Prepare for global npm package intallations
ENV PATH="$PATH:${NPM_CONFIG_PREFIX}/bin:/home/node/bin"

WORKDIR /home/node/bit-workspace

# CMD ["bash"]
