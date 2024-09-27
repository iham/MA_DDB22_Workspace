FROM node:alpine

RUN apk add dumb-init

RUN npm i sample-pilet-service -g

COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 9000

WORKDIR /piral-sample-feed-service

ENV PORT=9000

CMD [ "sample-pilet-service"]
