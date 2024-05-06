# Use a specific version of Node.js based on Alpine Linux for a smaller image size
ARG NODE_VERSION=16.16.0
FROM node:${NODE_VERSION}-alpine

# Define environment variables for application directory and server host
ENV APP_ROOT /home/app/web
ENV HOST 0.0.0.0

# Install necessary packages for building native dependencies
# Adding `python3` and `py3-pip` for Python support, and other dependencies for image processing and general utilities
RUN apk add --update --no-cache \
    bash \
    tzdata \
    libwebp-tools \
    libpng-dev \
    libjpeg-turbo-dev \
    giflib-dev \
    tiff-dev \
    autoconf \
    automake \
    make \
    gcc \
    g++ \
    wget \
    curl \
    jq \
    py3-configobj \
    py3-pip \
    py3-setuptools \
    python3 \
    python3-dev \
    && ln -s /usr/bin/python3 /usr/bin/python

# Install libwebp from source for webp image support
RUN wget --no-check-certificate https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.0.tar.gz \
    && tar -xvzf libwebp-1.0.0.tar.gz \
    && cd libwebp-1.0.0 \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf libwebp-1.0.0 libwebp-1.0.0.tar.gz

# Install pm2 globally for process management
RUN npm install pm2 -g

# Set the working directory to the app root
WORKDIR ${APP_ROOT}

# Expose port 3000 for the application
EXPOSE 3000
