#!/bin/bash

docker stop backend-php-s1

./build.sh
./start.sh