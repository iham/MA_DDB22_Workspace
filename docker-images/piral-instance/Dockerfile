FROM node:alpine

RUN apk add dumb-init

RUN npm install piral-cli -g

RUN piral new piral-instance --bundler=webpack5

WORKDIR /piral-instance

ARG PORT=1234
ENV PORT=$PORT

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["piral", "debug"]

EXPOSE $PORT