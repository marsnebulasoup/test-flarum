# Use the official PHP image with the FPM (FastCGI Process Manager)
FROM php:fpm

# Install extensions
# You may need to install additional PHP extensions required by your application
RUN docker-php-ext-install pdo_mysql

# Copy your application's code to the container
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# You can also set up any necessary permissions here
# Example: RUN chown -R www-data:www-data /var/www/html