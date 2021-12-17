#!/bin/bash
docker run -d --rm --name db-mysql-d1 -p 3306:3306 --network microservicesNetwork -e MYSQL_ROOT_PASSWORD=my-secret-pw db-mysql-d1:latest
