ARG NODE_VERSION=12.18.3
FROM node:${NODE_VERSION}-alpine

ARG NODE_ENV=production
ENV NODE_ENV ${NODE_ENV}

ENV APP_ROOT /home/app/web
ENV HOST 0.0.0.0

###########################################################################
# Set Timezone
###########################################################################
ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add --update bash

RUN apk add --no-cache --update libwebp-tools libpng-dev libjpeg-turbo-dev giflib-dev tiff-dev autoconf automake make gcc g++ wget

RUN wget --no-check-certificate https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.0.tar.gz && \
  tar -xvzf libwebp-1.0.0.tar.gz && \
  cd libwebp-1.0.0 && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf libwebp-1.0.0 libwebp-1.0.0.tar.gz

EXPOSE 3000
