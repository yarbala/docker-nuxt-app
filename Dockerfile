ARG NODE_VERSION=12.16.3
FROM node:${NODE_VERSION}-alpine

ENV APP_ROOT /home/app/web
ENV HOST 0.0.0.0

RUN apk add --update --no-cache bash tzdata libwebp-tools libpng-dev libjpeg-turbo-dev giflib-dev tiff-dev \
    autoconf automake make gcc g++ wget curl curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev

RUN wget --no-check-certificate https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.0.tar.gz && \
  tar -xvzf libwebp-1.0.0.tar.gz && \
  cd libwebp-1.0.0 && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf libwebp-1.0.0 libwebp-1.0.0.tar.gz

RUN npm install pm2 -g

EXPOSE 3000

WORKDIR ${APP_ROOT}
