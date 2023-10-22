#!/bin/bash

#
# Script to stop your Portainer
#
# Uses the admin password specified in the .env file
DOCKER_COMPOSE_ARGS="-f docker-compose.yml down"
docker-compose $DOCKER_COMPOSE_ARGS

exit 0
