FROM mysql:latest

LABEL Maintainer="Sarmad Jari <sarmad.jari@gmal.com>"
LABEL Description="Lightweight container with prepared MySQL Database"

ENV SERVICENAME=DEBIAN-MYSQL
ENV SECRIVEVESRION=v0.1

# Copy sql script to prepare the database
COPY setup.sql /docker-entrypoint-initdb.d/

# Expose the port mysql is reachable on
EXPOSE 3306

# Start the MySQL Database service
CMD ["mysqld"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD mysqladmin ping -h localhost
