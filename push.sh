#!/bin/bash

docker build -t yarbala/nuxt-app:v16.16 .

docker push yarbala/nuxt-app:v16.16
