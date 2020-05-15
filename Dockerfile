FROM node:10-alpine
#FROM node:10-jessie

ENV PORT 3000
RUN apk update \
    && apk add --no-cache git \
#    bash \
    lcms2-dev \
    libpng-dev \
    gcc \
    g++ \
    make \
    autoconf \
    automake

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json /usr/src/app/
RUN npm install -g --force yarn@1.22.0 \
    && yarn install

# Copy source files and pre-built next optimized files (obtained via yarn run now-build)
COPY . /usr/src/app/
RUN ls -ltr

EXPOSE 3000

CMD "yarn" "run" "start"