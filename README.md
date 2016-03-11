# Dockaf

[![Container Logo](https://github.com/Adron/systemic-dockaf/blob/master/Logo.png?raw=true)]()

[![License](https://img.shields.io/github/license/Adron/systemic-dockaf.svg?style=flat-square)](https://github.com/Adron/systemic-dockaf/blob/master/LICENSE)
[![Maintenance](https://img.shields.io/maintenance/yes/2016.svg?style=flat-square)](#)
[![Issues](https://img.shields.io/github/issues/adron/systemic-dockaf.svg?style=flat-square)](https://github.com/Adron/systemic-dockaf/issues)
[![Docker Pulls](https://img.shields.io/docker/pulls/adron/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adron/dockaf/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/_/adron/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adron/dockaf/)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/_/adron/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adron/dockaf/)

Docker image for development using Kafka.

## Prerequisites

1. [docker-compose](https://docs.docker.com/compose/overview/)
* KAFKA_ADVERTISED_HOST_NAME in docker-compose.yml to match your docker host IP (Do not use "localhost" but the actual IP)
* Kafka parameters can be set by adding environment variables to docker-compose.yml. i.e. KAFKA_AUTO_CREATE_TOPICS_ENABLE: 'true'

## Using the Image

This will get your cluster started.

	`docker-compose up -d 

*Author(s):* [![Adron Hall](https://github.com/Adron/systemic-dockaf/blob/master/AdronHall.png?raw=true)](http://compositecode.com) @ **[Github](https://www.github.com/adron)** or **[Twitter](https://twitter.com/adron)**.
