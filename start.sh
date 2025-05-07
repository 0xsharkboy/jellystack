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

# Start containers
docker-compose up -d

# Set owner
echo "Set current folder owner to ${PUID}:${PGID}"
sudo chown -R ${PUID}:${PGID} .
