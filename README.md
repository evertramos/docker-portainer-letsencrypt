# Docker Portainer running with auto generate/renew Let's Encrypt Certificate

With this repo you will be able to set up the fantastic [Portainer](https://portainer.io) as a container over SSL auto generated and auto renewed by our Web Proxy.

![Portainer Enviornment](https://github.com/evertramos/images/blob/master/portainer.jpg)

# Prerequisites

In order to use this compose file (docker-compose.yml) you must have:

1. docker [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
2. docker-compose [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
3. docker-compose-letsencrypt-nginx-proxy-companion [https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion)

# How to use

1. Clone this repository:

```bash
git clone https://github.com/evertramos/docker-portainer-letsencrypt.git
```

2. Make a copy of our .env.sample and rename it to .env:

Update this file with your preferences.

```bash
#
# docker-portainer-letsencrypt
# 
# Portainer configured to work along with our Web Proxy
# https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion
#
# This is the .env file to set up your portainer enviornment

#
# Container name for your Portainer
#
CONTAINER_NAME=portainer

#
# Path where your Portainer files will be located
#
PORTAINER_DATA_PATH=/path/to/your/portainer/data

#
# Password for Admin user
#
ADMIN_PASSWORD=your_admin_password

#
# Your domain (or domains)
#
DOMAINS=domain.com,www.domain.com,portainer.domain.com

#
# Your email for Let's Encrypt register
#
LETSENCRYPT_EMAIL=your_email@domain.com

#
# Network name
# 
# The network name must be the same name of your webproxy (proxy container)
#
NETWORK=webproxy

#--
```

3. Start your container

You can run our script, and it will use your predefined password:
```bash
# ./run.sh
```

Or you can simply start your compose enviornment:
```bash
# docker-compose up -d
```

> If you run only `docker-compose up -d` you will be prompted to set your admin passowrd when accessing your browser.

> Please keep in mind that when starting for the first time it may take a few moments (even a couple minutes) to get your Let's Encrypt certificates generated.

### Any further Portainer configuration please check [Portainer Official Documentation](https://portainer.readthedocs.io/en/stable/index.html)

