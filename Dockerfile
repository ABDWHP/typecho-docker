FROM php:7.2.10-fpm-alpine3.8    
LABEL maintainer="i@indexyz.me"

COPY code.sh /code.sh

# remove pdo,mbstring
RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install  pdo_mysql bcmath && \
  mkdir -p /var/www/html/typecho         &&\
  chmod +x /code.sh         

ENTRYPOINT [ "sh", "/code.sh" ]