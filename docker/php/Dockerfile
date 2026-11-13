FROM php:8.3-apache

# Installation des extensions PDO pour MySQL/MariaDB
RUN docker-php-ext-install pdo pdo_mysql

# Activation de mod_rewrite pour rediriger toutes les URLs vers public/index.php
RUN a2enmod rewrite

# Définir /var/www/html/public comme racine web Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
