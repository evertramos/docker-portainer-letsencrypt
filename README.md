# Docker Portainer running with auto generate/renew Let's Encrypt Certificate

Spin up a [Portainer&reg;](https://portainer.io) instance with a managed SSL certificate with two commands.

![Portainer Enviornment](https://github.com/evertramos/images/blob/master/portainer.jpg)

# Prerequisites

1. docker [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
2. docker-compose [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

# How to use

1. Clone this repository:

```sh
git clone https://github.com/evertramos/docker-portainer-letsencrypt.git
```

2. Make a copy of our .env.sample and rename it to .env:

3. Start your container

You can run our script, and it will use your predefined password:

```sh
./start.sh
```

> [!NOTE]
> Keep in mind that when starting for the first time it may take a few moments (even a couple minutes) to get your Let's Encrypt certificates generated.
