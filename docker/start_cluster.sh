#!/usr/bin/env bash
export HOST_IP=$(ifconfig | grep -A 1 'en0' | tail -1 | cut -d ' ' -f 2)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "Starting local Kafka cluster"
cd $DIR
docker-compose up -d

./wait_brokers_up.sh
