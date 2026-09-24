FROM node:22-bookworm-slim

ARG OPENCODE_VERSION=1.18.32

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      bash \
      python3 \
      python3-pip \
      python3-venv \
      build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://github.com/anomalyco/opencode/releases/download/v${OPENCODE_VERSION}/opencode-linux-x64.tar.gz" \
      -o /tmp/opencode.tar.gz \
 && tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin \
 && chmod +x /usr/local/bin/opencode \
 && rm /tmp/opencode.tar.gz \
 && opencode --version

WORKDIR /workspace
