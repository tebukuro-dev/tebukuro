FROM ruby:3.1-slim-bullseye as base

ENV TZ=Asia/Tokyo
ENV BUNDLE_JOBS=4
ENV BUNDLE_PATH=vendor/bundle

WORKDIR /app

RUN apt-get update -qq \
      && apt-get install --no-install-recommends -y \
            lsb-release \
            ca-certificates \
            gnupg \
            curl \
      && echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
      && curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
      && apt-get update \
      && apt-get install --no-install-recommends -y \
            postgresql-client-14 \
      && apt-get clean \
      && rm --recursive --force /var/lib/apt/lists/*

FROM base as dev

RUN apt-get update -qq \
      && apt-get install --no-install-recommends -y \
            build-essential \
            libpq-dev \
      && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
      && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
      && apt-get update \
      && apt-get install --no-install-recommends -y \
            nodejs \
            yarn \
      && apt-get clean \
      && rm --recursive --force /var/lib/apt/lists/*
