#!/bin/bash

docker build -t yarbala/nuxt-app:v1.0.0 .

docker push yarbala/nuxt-app:v1.0.0
