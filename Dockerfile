FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    nginx \
    postgresql \
    postgresql-contrib \
    git \
    curl \
    supervisor

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Clone tt-rss
RUN git clone https://git.tt-rss.org/fox/tt-rss.git /var/www/html

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Create necessary directories
RUN mkdir -p /var/www/html/cache/images \
    && mkdir -p /var/www/html/cache/upload \
    && mkdir -p /var/www/html/feed-icons \
    && chown -R www-data:www-data /var/www/html

# Copy configuration files
COPY config.php /var/www/html/config.php
COPY nginx.conf /etc/nginx/nginx.conf
COPY php.ini /usr/local/etc/php/conf.d/custom.ini
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY init-db.sh /init-db.sh

# Make init script executable
RUN chmod +x /init-db.sh

# Expose ports
EXPOSE 7860 5432

# Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]