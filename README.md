# Dockaf

[![Container Logo](https://github.com/adron-orange/systemic-dockaf/blob/master/Logo.png?raw=true)](https://github.com/adron-orange/systemic-dockaf)

[![License](https://img.shields.io/github/license/adron-orange/systemic-dockaf.svg?style=flat-square)](https://github.com/adron-orange/systemic-dockaf/blob/master/LICENSE)
[![Maintenance](https://img.shields.io/maintenance/yes/2016.svg?style=flat-square)](#)
[![Issues](https://img.shields.io/github/issues/adron-orange/systemic-dockaf.svg?style=flat-square)](https://github.com/adron-orange/systemic-dockaf/issues)
[![Docker Pulls](https://img.shields.io/docker/pulls/adron-orange/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adronorange/dockaf/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/_/adron-orange/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adronorange/dockaf/)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/_/adron-orange/systemic-dockaf.svg?style=flat-square)](https://hub.docker.com/r/adronorange/dockaf/)

Docker image for development using Kafka.

## Prerequisites (DO THIS BEFORE LAUNCHING)

* [docker-compose](https://docs.docker.com/compose/overview/)
* KAFKA_ADVERTISED_HOST_NAME in docker-compose.yml to match your docker host IP (Do not use `localhost` but the actual IP).
* Kafka parameters can be set by adding environment variables to docker-compose.yml. i.e. KAFKA_AUTO_CREATE_TOPICS_ENABLE: 'true'

## Using the Image

Did you update docker-compose.yml with your docker host IP (the KAFKA_ADVERTISED_HOST_NAME env variable)?

This will get your cluster started.

	docker-compose up -d

Set the number of nodes in the cluster.

	docker-compose scale kafka=5

You can also run from a specific docker-compose.yml file by entering the following command.

	docker-compose -f docker-compose-another-composition.yml up

To stop all of the clustered nodes use the following command.

	docker-compose stop

## Brokers

Specify a broker ID in the docker-compose file, if not it will be automatically generated. This is for scaling up and down. If the ID isn't specified the --no-recreate option for docker-compose should likely be used. I've not been able to test it yet. But just seems it might be the case.

## Topic Creation

To create topics automatically the KAFKA_CREATE_TOPICS environment variable in the docker-compose.yml is set. Currently I have it set to Topic 1, with 1 partition and 3 replicas, and Topic 2 has 1 partition and 3 replicas.

Snippet:
    environment:
      KAFKA_CREATE_TOPICS: "Topic1:2:4,Topic2:1:3"

## Hax & Shell Use i.e. How to Use This Thing

To startup a shell use the following script (located in scripts).

	./shell-it.sh <DOCKER_HOST_IP> <ZOOKEEPER_HOST:POST>

Verification the cluster is created and running, create a topic and start a producer.

	$WHERE_KAFKA_LIVES/bin/kafka-topic.sh --create --topic topic \
		--partitions 4 --zookeeper $ZK --replication-factor 2
	$WHERE_KAFKA_LIVES/bin/kafka-topics.sh --describe --topic topic --zookeeper
	$WHERE_KAFKA_LIVES/bin/kafka-console-producer.sh --topic=topic \
		--broker-list=`brokers.sh`

Start shell 2 (in a new tab or whatnot) and run a consumer.

	$WHERE_KAFKA_LIVES/bin/kafka-console-consumer.sh --topic=topic --zookeeper=$ZK

Use docker-compose logs/docker logs for troubleshooting.

Don't use 'localhost' or '127.0.0.1'.

*Author(s):* [![Adron Hall](https://github.com/adron-orange/systemic-dockaf/blob/master/AdronHall.png?raw=true)](http://compositecode.com) @ **[Github](https://www.github.com/adron-orange)** or **[Twitter](https://twitter.com/adron_orange)**.

**[Credits & Additional References](./references.md)**

