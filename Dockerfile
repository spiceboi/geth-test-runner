FROM node:carbon-alpine
RUN mkdir -p /usr/src/geth-test-runner
WORKDIR /usr/src/geth-test-runner
COPY package.json yarn.lock wait-for ./
COPY ./src ./src

RUN apk --no-cache --virtual build-dependencies add \
    git \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies

EXPOSE 3000
CMD [ "npm", "start" ]