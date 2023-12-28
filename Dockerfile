# Use the official PHP image with the FPM (FastCGI Process Manager)
FROM php:fpm

# Install extensions
# You may need to install additional PHP extensions required by your application
RUN apt update && apt install -y zlib1g-dev libpng-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install pdo_mysql

# Copy your application's code to the container
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# You can also set up any necessary permissions here
# Example: RUN chown -R www-data:www-data /var/www/html