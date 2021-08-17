#!/bin/bash

docker build -t yarbala/nuxt-app:latest -t yarbala/nuxt-app:v1.0.5 .

docker push yarbala/nuxt-app:v1.0.5
