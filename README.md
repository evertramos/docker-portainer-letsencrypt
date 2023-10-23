# Docker Portainer running with auto generate/renew Let's Encrypt Certificate

Spin up a [Portainer&reg;](https://portainer.io) instance with a managed SSL certificate with two commands.

![Portainer Enviornment](https://github.com/evertramos/images/blob/master/portainer.jpg)

## Prerequisites

1. docker [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
2. docker-compose [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

## Quick-start

1. Clone this repository:

```sh
git clone https://github.com/evertramos/docker-portainer-letsencrypt.git
```

2. Create an env file and fill it in:

```sh
cp .env.sample .env
```

3. Spin up the container and type "localhost" into your browser

```sh
./start.sh
```

## Usage

- Run container instance in the background:

```sh
./start.sh prod
```

- Stop the container instance:

> [!NOTE]
> If you're running it in the foreground, just `CTRL+C` will suffice

```sh
./stop.sh
```

## Disclaimers

> [!NOTE]
> Keep in mind that when starting for the first time it may take a few moments (even a couple minutes) to get your Let's Encrypt certificates generated.
