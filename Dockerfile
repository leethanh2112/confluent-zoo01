FROM confluentinc/cp-zookeeper:latest
MAINTAINER ThanhCL

# Download agent & config
RUN mkdir /home/prometheus

COPY jmx_prometheus_javaagent-0.3.1.jar /home/prometheus/prometheus/jmx_prometheus_javaagent-0.3.1.jar
COPY zookeeper.yaml /home/prometheus/zookeeper.yaml
COPY zookeeper.properties /etc/kafka/zookeeper.properties
COPY confluent-zookeeper.service /lib/systemd/system/confluent-zookeeper.service

ENV KAFKA_OPTS="-javaagent:/opt/kafka/prometheus/jmx_prometheus_javaagent-0.3.1.jar=7071:/opt/kafka/prometheus/kafka-0-8-2.yml" 








