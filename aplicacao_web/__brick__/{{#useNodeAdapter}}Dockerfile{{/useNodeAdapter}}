FROM node:18.14-alpine as builder
WORKDIR /app

COPY *.* ./
COPY src ./src
COPY static ./static

RUN npm install
RUN npm run build

CMD [ "build/index.js" ]