# Base -----------
FROM debian:12.7

CMD ["bash"]

# VS CODE WS (BIT) ----------------
RUN apt-get update && apt-get install -y curl dumb-init git git-lfs htop locales lsb-release man-db nano openssh-client procps sudo vim-tiny wget zsh && git lfs install && rm -rf /var/lib/apt/lists/*
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen

ENV LANG=en_US.UTF-8
RUN adduser --gecos '' --disabled-password coder && echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

RUN ARCH="$(dpkg --print-architecture)" && curl -fsSL "https://github.com/boxboat/fixuid/releases/download/v0.6.0/fixuid-0.6.0-linux-$ARCH.tar.gz" | tar -C /usr/local/bin -xzf - && chown root:root /usr/local/bin/fixuid && chmod 4755 /usr/local/bin/fixuid && mkdir -p /etc/fixuid && printf "user: coder\ngroup: coder\n" > /etc/fixuid/config.yml

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN dpkg -i /tmp/packages/code-server*$(dpkg --print-architecture).deb

ENV ENTRYPOINTD=/entrypoint.d

EXPOSE 8080/tcp

USER 1000

ENV USER=coder

WORKDIR /home/coder

ENTRYPOINT ["/usr/bin/entrypoint.sh" "--bind-addr" "0.0.0.0:8080" "."]

RUN sudo apt-get update
RUN sudo apt-get install -y nodejs npm
RUN sudo adduser --disabled-password --gecos '' user
RUN sudo chown -R user /usr/local/


USER user

RUN npm i @teambit/bvm -g
# RUN bvm config set RELEASE_TYPE nightly
RUN bvm upgrade
ENV PATH "$PATH:/home/user/bin"

ENV BIT_GLOBALS_DIR=/tmp/bit

RUN bit config set analytics_reporting false
RUN bit config set no_warnings false
RUN bit config set interactive false
RUN bit config set error_reporting true

RUN code-server --install-extension=bit.vscode-bit --auth=none

WORKDIR /home/user