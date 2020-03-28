FROM confluentinc/cp-zookeeper:latest
MAINTAINER ThanhCL

# Download agent & config
RUN mkdir /home/prometheus

COPY jmx_prometheus_javaagent-0.3.1.jar /home/prometheus/prometheus/jmx_prometheus_javaagent-0.3.1.jar
COPY zookeeper.yaml /home/prometheus/zookeeper.yaml
COPY zookeeper.properties /etc/kafka/zookeeper.properties
COPY confluent-zookeeper.service /lib/systemd/system/confluent-zookeeper.service

ENV KAFKA_OPTS="-javaagent:/home/prometheus/jmx_prometheus_javaagent-0.3.1.jar=10999:/home/prometheus/kafka-0-8-2.yml" 









