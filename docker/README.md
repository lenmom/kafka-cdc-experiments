# Local cluster with no SSL on Mac

This docker-compose file is meant to run a working cluster with 3 Kafka nodes, 1 ZooKeeper and 1 Schema Registry
in **Docker for Mac** (not in a docker-machine).

This cluster uses `PLAINTEXT` only to connect to Kafka and http to Schema Registry.

It has been tested with Docker for Mac version 18.03.1-ce

Given the networking limitations of Docker for Mac, nodes communicates each other using the external IP of the host machine (not 127.0.0.1).

## Requirements

* Docker for Mac version 18.03.1
* The host machine must be connected to some network (i.e. must have an IP different from localhost)
* It may be useful to install the Confluent platform (v.4.1.1) on the local machine, to use CLI tools

## Running the cluster

You may use the `start_cluster.sh` and `stop_cluster.sh` script in this directory to start and stop the cluster.

Alternatively...

1) Set up the `HOST_IP` environment variable with the IP of your machine (not 127.0.0.1).

To capture the IP address of the WiFi port of a MacBookPro:
```
$ export HOST_IP=$(ifconfig | grep -A 1 'en0' | tail -1 | cut -d ' ' -f 2)
```

2) Start the cluster

```
$ docker-compose up -d
```

3) Wait for the cluster to be up and running

By definition, there is no final indicator telling when a Kafka cluster is "healty".
You may only wait for Kafka nodes to be "started".

```
$ ./wait-brokers.sh
```

## Stopping the cluster

To Tear down the cluster:
```
$ docker-compose down
```


## Accesssing the cluster

You may access all nodes using `localhost`.

Beware nodes are also exposed to the external interface of your machine.

Kafka brokers are accessible from the host machine on:
* kafka-1: localhost:19092
* kafka-2: localhost:29092
* kafka-3: localhost:39092

The single Zookeper node is accessible from the host machine on:
* zk1: localhost:22181

Schema-Registry is accessible from the host machine on:
* schema-registry: http://localhost:18081


## Versions

The cluster uses Confluent Platform OSS version 4.1.2, by default.
It may be changed editing `./env`.

Conflent Platform 4.1.2 includes Kafka 1.1.1-cp1


