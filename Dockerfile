# Set base image.
FROM alpine:latest

MAINTAINER Jan Romaniak <romaniakjan@gmail.com>

# Define rancher-compose version
ENV RANCHER_COMPOSE_VERSION=v0.12.1

# Install dependencies and rancher-compose
RUN apk add --quiet --no-cache ca-certificates && \
	apk add --quiet --no-cache --virtual build-dependencies curl && \
	curl -sSL https://github.com/rancher/rancher-compose/releases/download/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz | tar -xz -C /usr/bin --strip-components=2 && \
	chmod +x /usr/bin/rancher-compose && \
	apk del build-dependencies && \
	rm -rf /var/cache/*

# Set working directory
WORKDIR /workspace
