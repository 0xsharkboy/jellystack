#!/usr/bin/bash

# Import .env file
if [ -f .env ]
then
    echo "Importing .env..."
    export $(cat .env | xargs)
else
    echo "Please create .env file before xecuting this script"
    exit 1
fi

# Set owner
echo "Set current folder owner to ${PUID}:${PGID}"
sudo chown -R ${PUID}:${PGID} .

# Pull docker images
echo "Pull docker images"
docker-compose pull
