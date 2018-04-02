# Extend latest lts node on alpine linux
FROM node:carbon-alpine

# Make source directory
RUN mkdir -p /usr/src/geth-test-runner

# Set workdir and change to source directory
WORKDIR /usr/src/geth-test-runner

# Copy required files and folders
COPY package.json wait-for ./
COPY ./src ./src

# Grab dependencies
RUN apk --no-cache --virtual build-dependencies add \
    git \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies

# Expose 3000 in case we're running nodemon
EXPOSE 3000

# Execute  babel-node --presets=latest ./src/index.js by default
CMD [ "npm", "start" ]