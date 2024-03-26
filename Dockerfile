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




