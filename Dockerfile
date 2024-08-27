# Use an official PHP runtime as a parent image
FROM php:8.2.4

# Set the working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Copy the existing application code into the container
COPY . /var/www

# Install application dependencies
RUN composer install

# Set the permissions
RUN chown -R www-data:www-data /var/www

# Expose port 9000 and start the application
EXPOSE 9000
CMD ["php-fpm"]
#CMD ["php", "artisan", "serve", "--host=0.0.0.0"]

