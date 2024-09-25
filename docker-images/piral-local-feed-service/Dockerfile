FROM node:alpine

RUN apk add dumb-init

RUN npm install piral-cli piral-cli-local-feed -g

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

ENV PORT=9000

WORKDIR /piral-local-feed-service

CMD ["piral", "local-feed"]