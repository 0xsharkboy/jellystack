#!/usr/bin/bash

# Check for .env file
if [ ! -f .env ]
then
    echo "Please create .env file before executing this script"
    exit 1
fi

# Create i2p network
docker network create i2p_network 2>/dev/null || true

# Start containers
docker-compose -f i2pd/docker-compose.yml up -d
docker-compose up -d

# Set owner
echo "Set current folder owner to ${PUID}:${PGID}"
sudo chown -R ${PUID}:${PGID} .
