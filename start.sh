#!/bin/bash

#
# Script to start a Portainer container instance
#

is_env_file_exists() {
    if [ ! -e .env ]; then
        echo "ERROR: No .env file found"
        exit 1
    fi
}

is_env_vars_defined() {
    PATH_TO_ENV_FILE="./.env"
    while IFS= read -r line; do
        if [[ "$line" =~ .*=+$ ]]; then
            echo "WARNING: Empty env var: $line"
        fi
    done <"$PATH_TO_ENV_FILE"

    source "$PATH_TO_ENV_FILE"

    if [ $ADMIN_PASSWORD = "your_admin_password" ]; then
        echo "WARNING: You're using the same admin password as our sample. Consider changing it."
    fi
}

generate_encrypted_password() {
    ENCRYPTED_PASSWORD=$(docker run --rm httpd:2.4-alpine htpasswd -nbB admin $ADMIN_PASSWORD | cut -d ":" -f 2)
    sed -i '' -e '/ENCRYPTED_PASSWORD/d' ./.env
    echo "ENCRYPTED_PASSWORD='$ENCRYPTED_PASSWORD'" >>.env
}

run_docker_compose() {
    DOCKER_COMPOSE_ARGS="-f docker-compose.yml up"
    [[ $1 == "prod" ]] && DOCKER_COMPOSE_ARGS+=" -d"
    docker-compose $DOCKER_COMPOSE_ARGS
}

script_entrypoint() {
    is_env_file_exists
    is_env_vars_defined
    generate_encrypted_password
    run_docker_compose $1
    exit 0
}

script_entrypoint "$@"
