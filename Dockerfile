# Base image
FROM php:8.2-apache

# Working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Install dependencies
RUN apt-get update && apt-get install -y unzip git \
    && docker-php-ext-install pdo pdo_mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
