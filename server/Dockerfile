FROM node:12.16-alpine

WORKDIR /server/app

RUN apk add --update --no-cache autoconf libtool automake alpine-sdk

RUN apk add --update --no-cache git bash yarn nano

CMD npm install && npm start
