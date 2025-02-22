FROM node:14-alpine

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . .

RUN yarn build

ENV NODE_ENV=production
ENV NODE_OPTIONS=--unhandled-rejections=throw
ENV LOG_LEVEL=info

CMD node dist/index.js