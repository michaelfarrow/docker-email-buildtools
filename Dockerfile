FROM ubuntu

MAINTAINER "Mike Farrow" <contact@mikefarrow.co.uk>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs make ruby ruby-dev && \
    apt-get remove --purge curl -y && \
    apt-get clean

RUN npm config set registry http://registry.npmjs.org/ && \
    npm install -g --no-optional gulp@3.8.11 && \
    npm install -g --no-optional gulp-zip@3.0.2 && \
    npm install -g --no-optional gulp-inline-css@2.0.0 && \
    npm install -g --no-optional gulp-inline@0.0.12 && \
    npm install -g --no-optional gulp-minify-css@1.2.0

WORKDIR /data
