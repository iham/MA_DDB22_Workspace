FROM node:alpine

RUN apk add dumb-init

RUN npm install piral-cli -g

RUN piral new piral-instance --bundler=webpack5

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

WORKDIR /piral-instance

CMD ["piral", "debug", "--port", "3000"]