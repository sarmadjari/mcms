#!/bin/bash

# Reafresh the base image for the alpine-nginx-php
./alpine-nginx-php/build.sh

# Stop the dockers (will be deleted) 
docker stop backend-php-s1
docker stop db-mysql-d1

# Remove the Network
docker network delete microservicesNetwork
# Create the network
docker network create microservicesNetwork

## Database MySQL 1 ##
# Build the Database Container Image
./db-mysql-d1/build.sh

# Run the Database Container
./db-mysql-d1/start.sh

## Backend PHP Service 1 ##
# Build the Backend Container Image
./backend-php-s1/build.sh

# Run the Backend Container
./backend-php-s1/start.sh