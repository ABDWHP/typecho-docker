FROM php:fpm-alpine    
LABEL maintainer="i@indexyz.me"

COPY run.sh /run.sh

# remove pdo,mbstring
RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install  pdo_mysql bcmath && \
  mkdir -p /var/www/html/typecho         &&\
  chmod +x /run.sh         &&\
  chown -R www-data:www-data /var/www/html 

ENTRYPOINT [ "sh", "/run.sh" ]