FROM node:22-bookworm-slim

ARG OPENCODE_VERSION=2.0.16

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

# OpenCode v2 is distributed as the npm package @opencode/cli-linux-x64.
RUN curl -fsSL "https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${OPENCODE_VERSION}.tgz" \
      -o /tmp/opencode.tgz \
 && tar -xzf /tmp/opencode.tgz -C /tmp \
 && install -m 0755 /tmp/package/bin/opencode /usr/local/bin/opencode \
 && rm -rf /tmp/opencode.tgz /tmp/package \
 && opencode --version

WORKDIR /workspace
