#!/bin/sh

# Generate SSL certificate and key if they don't exist
if [ ! -f /etc/nginx/ssl/inception.crt ] || [ ! -f /etc/nginx/ssl/inception.key ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive Helsinki/OU=dgerguri/CN=dgerguri.42.fr/UID=dgerguri"
fi
# Start NGINX
nginx -g "daemon off;"
