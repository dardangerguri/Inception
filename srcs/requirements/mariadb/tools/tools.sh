#!/bin/bash

# Create necessary directories and set permissions
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Initialize MySQL data directory
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# Configure MySQL
mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

# Create a new database with provided name and character set
CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;

# Create a new user with provided credentials
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASSWORD';

# Grant all privileges on the newly created database to the user
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

# Grant all privileges globally to the user, allowing them to grant privileges to other users
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;

# Grant SELECT privileges on the MySQL system database to the user
GRANT SELECT ON mysql.* TO '$DB_USER'@'%';

# Change the password of the root user for localhost
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

# Flush privileges to apply changes
FLUSH PRIVILEGES
EOF

# Start MariaDB server with custom configuration file
exec mysqld --defaults-file=/etc/my.cnf.d/MariaDB.cnf
