#!/bin/bash

WORKSPACE=/home/dbt-pg

CONTAINER_NAME=dbt-pg

docker rm -f $CONTAINER_NAME &> /dev/null

docker run -d \
	--name $CONTAINER_NAME \
	--net=host \
	-v $PWD:$WORKSPACE \
	-v $PWD/profiles.yml:/root/.dbt/profiles.yml \
	-w $WORKSPACE \
	245982562/datafacts:latest dbt run