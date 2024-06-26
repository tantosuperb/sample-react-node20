FROM node:20-alpine3.18

WORKDIR /app

COPY package*.json .
RUN npm ci

COPY src src
COPY public public
RUN npm run build

ENV START_COMMAND="npx serve -sn build"
ENTRYPOINT ${START_COMMAND}

## CC. infinity loop for docker container exec
#ENTRYPOINT while :; do echo 'Press <CTRL+C> to exit.'; sleep 1; done