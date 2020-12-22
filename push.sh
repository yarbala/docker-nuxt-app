#!/bin/bash

docker build -t yarbala/nuxt-app:latest -t yarbala/nuxt-app:v1.0.1 .

docker push yarbala/nuxt-app:v1.0.1
