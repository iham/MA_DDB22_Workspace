ARG CODE_SERVER_VERSION=latest

FROM debian:trixie-slim AS base

RUN apt-get update && apt-get install -y curl wget
RUN ARCH="$(dpkg --print-architecture)" \
    && eval wget $(curl -s "https://api.github.com/repos/boxboat/fixuid/releases/latest" | grep "browser_download_url" | grep "$ARCH.tar.gz" | cut -d : -f 2,3) -P /tmp \
    && tar -C /usr/local/bin -xzf /tmp/fixuid-* \
    && chown root:root /usr/local/bin/fixuid \
    && chmod 4755 /usr/local/bin/fixuid

FROM node:20-alpine
ARG CODE_SERVER_VERSION

RUN apk add alpine-sdk bash dumb-init git-lfs krb5-pkinit krb5-dev krb5 libstdc++ libc6-compat python3 sudo shadow
RUN git lfs install

# RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen \
#   && locale-gen
# ENV LANG=en_US.UTF-8

RUN npm i npm@latest piral-cli@latest -g

# Install VS Code Server
RUN npm i code-server@${CODE_SERVER_VERSION} -g --unsafe-perm

RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
COPY --from=base /usr/local/bin/fixuid /usr/local/bin/fixuid
RUN mkdir -p /etc/fixuid \
    && printf "user: node\ngroup: node\n" > /etc/fixuid/config.yml

COPY entrypoint.sh /usr/bin/entrypoint.sh

EXPOSE 8080
# This way, if someone sets $DOCKER_USER, docker-exec will still work as
# the uid will remain the same. note: only relevant if -u isn't passed to
# docker-run.
USER 1000
ENV USER=node
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM=1
WORKDIR /piral

# Install piral extension to codeserver
RUN code-server --install-extension=smapiot.vscode-piral

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "."]