#!/bin/bash

docker build -t yarbala/nuxt-app:v16.10 .

docker push yarbala/nuxt-app:v16.10
