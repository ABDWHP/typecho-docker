FROM php:fpm-alpine    
LABEL maintainer="i@indexyz.me"

COPY run.sh /run.sh
COPY code.sh /code.sh

# remove pdo,mbstring
RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install  pdo_mysql bcmath && \
  mkdir -p /var/www/html/typecho         &&\
  chmod +x /run.sh         &&\
  chmod +x /code.sh         &&\

ENTRYPOINT [ "sh", "/run.sh" ]