# Use the Alpine Linux 3.18 image as the base image
FROM alpine:3.18

# Install PHP & MariaDB client dependencies
RUN apk update && \
    apk add php81 php81-fpm php81-mysqli fcgi wget && \
    apk add mariadb-client

# Download and install the WP-CLI tool
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Download and extract the WordPress package
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/html && \
    cd /var/www/html && \
    tar -xzf /var/www/html/wordpress-6.0.tar.gz && \
    rm /var/www/html/wordpress-6.0.tar.gz

# Create the directory for the WordPress installation
RUN mkdir -p /var/www/wordpress && \
	chown -R nginx:nginx /var/www/wordpress

# Copy the PHP-FPM configuration file to the container
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
RUN chmod 644 /etc/php81/php-fpm.d/www.conf

# Copy the tools.sh script from the 'tools' directory to the container
COPY tools/tools.sh .
RUN chmod +x tools.sh

# Expose port for PHP-FPM
EXPOSE 9000

# Set the entrypoint to run the WordPress script
ENTRYPOINT ["sh", "tools.sh"]
