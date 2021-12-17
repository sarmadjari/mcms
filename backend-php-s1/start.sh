#!/bin/bash

docker run -d --rm --name backend-php-s1 -p 80:8080 --network microservicesNetwork backend-php-s1:latest