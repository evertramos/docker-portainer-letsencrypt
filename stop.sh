#!/bin/bash

#
# Script to stop your Portainer 
#
# Uses the admin password specified in the .env file

docker-compose -f docker-compose-with-password.yml down

exit 0
