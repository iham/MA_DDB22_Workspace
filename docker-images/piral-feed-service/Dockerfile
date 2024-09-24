FROM node:alpine

RUN apk add dumb-init

RUN npm install piral-cli piral-cli-local-feed -g

# RUN piral new piral-instance --bundler=webpack5

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

ENV PORT=9000

WORKDIR /piral-feed

CMD ["piral", "local-feed"]