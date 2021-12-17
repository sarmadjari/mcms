#!/bin/bash
docker run -d --rm --name db-mssql-d2 -p 1433:1433 --network microservicesNetwork -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=my-secret-pw" -e "MSSQL_PID=Express" mcr.microsoft.com/mssql/server:2019-latest

