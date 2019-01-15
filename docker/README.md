# Local cluster with no SSL


This cluster uses `PLAINTEXT` only to connect to Kafka and http to Schema Registry.

It has been tested with Docker for Mac version 18.03.1-ce

## Requirements

* Docker version 18.03+
* The host machine must be connected to some network (i.e. must have an IP different from localhost)
* It may be useful to install the Confluent platform (v.4.1.1) on the local machine, to use CLI tools

### Known limitations

If the computer get disconnected from the network, or connected to a different network changing IP, the cluster goes nuts.

## Running the cluster

Start the cluster

```
$ docker-compose up -d
```

Wait for the cluster to be up and running

By definition, there is no final indicator telling when a Kafka cluster is "healty".
You may only wait for Kafka nodes to be "started".

```
$ ./wait_brokers.sh
```

## Stopping the cluster

To Tear down the cluster:
```
$ docker-compose down
```


## Accesssing the cluster

You may access all nodes using `localhost`.

Beware nodes are also exposed to the external interface of your machine.

Kafka brokers are accessible from the host machine on  (`PLAINTEXT` only):
* `kafka1`: `localhost:9092`
* `kafka2`: `localhost:9093`
* `kafka3`: `localhost:9094`

Schema-Registry is accessible from the host machine on:
* `schema-registry`: http://localhost:8081

Zookeper node is accessible from the host machine on:
* `zk1`: localhost:2181

Kafka Connect 
* `kafka-connect`: http://localhost:8083

MySQL 
* `db`: localhost:33306 (`root`/`my-password` or `mysqluser`/`secret`)
