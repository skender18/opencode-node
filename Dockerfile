FROM ghcr.io/anomalyco/opencode:latest

USER root
RUN apk add --no-cache \
      git \
      bash \
      curl \
      nodejs \
      npm \
      python3 \
      py3-pip \
      build-base

WORKDIR /workspace
