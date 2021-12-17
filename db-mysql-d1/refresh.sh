#!/bin/bash

docker stop db-mysql-d1

./build.sh
./start.sh