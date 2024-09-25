FROM codercom/code-server:latest

USER root

# add deps for node 20 ("Iron" - LTS)
ADD https://deb.nodesource.com/setup_20.x /tmp
RUN bash /tmp/setup_20.x \
    && rm /tmp/setup_20.x


RUN apt-get update \
    && apt-get -y install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm i npm@latest piral-cli -g

USER coder

# install piral extension to codeserver
RUN code-server --install-extension=smapiot.vscode-piral
