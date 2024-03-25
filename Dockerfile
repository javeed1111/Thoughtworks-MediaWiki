# Use a PHP Apache base image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Update package lists and install required dependencies
RUN apt-get update && \
    apt-get install -y \
        wget \
        unzip \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libpq-dev \
        libicu-dev \
        mariadb-server \
        && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd intl mysqli opcache pdo pdo_mysql

# Download and extract MediaWiki
RUN wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.5.tar.gz && \
    tar -xzf mediawiki-1.35.5.tar.gz --strip-components=1 && \
    rm mediawiki-1.35.5.tar.gz

# Set permissions and enable Apache mod_rewrite
RUN chown -R www-data:www-data /var/www/html && \
    a2enmod rewrite

# Expose port 80 (HTTP) and 3306 (MySQL)
EXPOSE 80 3306

# Start Apache server and MySQL
CMD service mysql start && apache2-foreground







# # Use a base image with Apache and PHP
# FROM php:7.4-apache

# # Set the working directory inside the container
# WORKDIR /var/www/html

# # Install required packages
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     git \
#     unzip \
#     && rm -rf /var/lib/apt/lists/*

# # Clone MediaWiki repository
# RUN git clone --branch REL1_35 --depth 1 https://github.com/wikimedia/mediawiki.git .

# # Install MediaWiki dependencies
# RUN docker-php-ext-install mysqli

# # Copy LocalSettings.php.sample to LocalSettings.php
# RUN cp ./LocalSettings.php.sample ./LocalSettings.php

# # Expose port 80 to the outside world
# EXPOSE 80

# # Start Apache server
# CMD ["apache2-foreground"]
# #
