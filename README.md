# Project goal

This project is meant to experiment with [Debezium MySQL CDC Kafka Connector](https://debezium.io/docs/connectors/mysql), to capture changes from a MySQL Database.

This includes all is required locally with Docker Compose, including:
- A 3 nodes Kafka cluster + ZooKeeper
- Schema Registry
- Kafka Connect + Debezium connector
- A MySQL instance with a sample database

**THIS IS STILL A WIP, far from being completed**

## Running the cluster 

This works on OSX only!

TBD


## Useful snippets

### Setting up the Connector

POST, `http://localhost:18083/connectors`

```
{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.hostname": "db",
    "database.port": "3306",
    "database.user": "debezium",
    "database.password": "dbz",
    "database.server.id": "12345",
    "database.server.name": "example",
    "database.whitelist": "inventory",
    "table.whitelist": "inventory.products,inventory.products_on_hand,inventory.customers,inventory.addresses,inventory.orders",
    "database.history.kafka.bootstrap.servers": "kafka-1:19092",
    "database.history.kafka.topic": "dbhistory.inventory",
    "include.schema.changes": "true"
  }
}
```

### Watching changelog topics
```
kafka-avro-console-consumer --bootstrap-server localhost:19092 --property schema.registry.url=http://localhost:18081 --from-beginning --topic example.inventory.products | jq '.'
```

## Useful docs

### Kafka Connect config example
https://docs.confluent.io/current/installation/docker/docs/installation/connect-avro-jdbc.html

### Kafka Connect API
https://docs.confluent.io/current/connect/references/restapi.html

### Debezium connector configuration
https://debezium.io/docs/connectors/mysql/#deploying-a-connector


## Interestin features to add to the cluster

Add KConnect UI and Topics UI from Landoop
https://github.com/simplesteph/kafka-stack-docker-compose/blob/master/full-stack.yml
