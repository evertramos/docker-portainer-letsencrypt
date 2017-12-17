#!/bin/bash

#
# Script to start your Portainer 
#
# Uses the admin password specified in the .env file

# 1. Check if .env file exists
if [ -e .env ]; then
    source .env
else 
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi

# 2. Passowrd for Admin User

#   2.1 Check if a password was set up in the .env file
if [ -z "$ADMIN_PASSWORD" ]; then
    echo "You must set up a password in your '.env' file."
    exit 1
fi

#   2.2 Check if passowrd was the same as sample file
if [ $ADMIN_PASSWORD = "your_admin_password" ]; then
    echo 
    echo "#-----------------------------------------------------------"
    echo "#"
    echo "# CAREFUL!"
    echo "#"
    echo "# You are using the same passowrd of our sample."
    echo "# Please change it AS SOON AS POSSÍBLE!"
    echo "#"
    echo "#-----------------------------------------------------------"
    echo
fi

#   2.3 Generate the encrypted password
ENCRYPTED_PASSWORD=$(docker run --rm httpd:2.4-alpine htpasswd -nbB admin $ADMIN_PASSWORD | cut -d ":" -f 2)

#   2.4 Delete old ENCRYPTED_PASSWORD
sed -i '/ENCRYPTED_PASSWORD/d' ./.env

#   2.4 Send passowrd to .env file
echo "ENCRYPTED_PASSWORD=$ENCRYPTED_PASSWORD" >> .env

# 3. Start Portainer container
docker-compose -f docker-compose-with-password.yml up -d

# Final message
echo 
echo "#-----------------------------------------------------------"
echo "#"
echo "# The WebProxy take a few moments to get the SSL Certificates"
echo "#"
echo "# Please check your browser to see if it is running, use your"
echo "# domain(s): "
echo "# $DOMAINS"
echo "#"
echo "#-----------------------------------------------------------"
echo


exit 0
