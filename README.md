# Docker Portainer running with auto generate/renew Let's Encrypt Certificate

With this repo you will be able to set up the fantastic [Portainer](https://portainer.io) as a container over SSL auto generated and auto renewed by our Web Proxy.

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
