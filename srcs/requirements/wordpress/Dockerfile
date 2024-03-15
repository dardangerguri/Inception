# Use the Alpine Linux 3.18 image as the base image
FROM alpine:3.18

# Install PHP & MariaDB client dependencies
RUN apk update && \
    apk add php81 php81-fpm fcgi && \
    apk add mariadb-client

# Create directories for PHP-FPM and WordPress
RUN mkdir -p /run/php/ && \
    mkdir -p /var/www/html/wordpress

# Copy the PHP-FPM configuration file to the container
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
RUN chmod 644 /etc/php81/php-fpm.d/www.conf

# Copy the tools.sh script from the 'tools' directory to the container
COPY tools/tools.sh .
RUN chmod +x tools.sh

# Expose port for PHP-FPM
EXPOSE 9000

# Command to set up WordPress
ENTRYPOINT ["sh", "tools.sh"]
