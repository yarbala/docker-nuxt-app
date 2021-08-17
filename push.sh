#!/bin/bash

docker build -t yarbala/nuxt-app:latest -t yarbala/nuxt-app:v1.0.6 .

docker push yarbala/nuxt-app:v1.0.6
