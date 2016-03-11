FROM anapsix/alpine-java
MAINTAINER Adron Hall

# Environment Variables
ENV KAFKA_VERSION="0.9.0.1" 		SCALA_VERSION="2.11"

RUN apk add --update unzip wget curl docker jq coreutils

ADD scripts/download.sh /tmp/download.sh
RUN /tmp/download.sh && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD scripts/start.sh /usr/bin/start.sh
ADD scripts/brokers.sh /usr/bin/brokers.sh
ADD scripts/topics.sh /usr/bin/topics.sh

CMD ["start.sh"]
