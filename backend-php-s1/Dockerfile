FROM backend-php:latest

LABEL Maintainer="Sarmad Jari <sarmad.jari@gmal.com>"
LABEL Description="Lightweight container with Nginx & PHP based on Alpine Linux."

ENV SERVICENAME=ALPINE-NGINX-PHP
ENV SECRIVEVESRION=v0.1

# copy updated configuration of the Nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Add application
WORKDIR /var/www/html
COPY --chown=nobody src/ /var/www/html/

# Expose the port nginx is reachable on
EXPOSE 8080

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping