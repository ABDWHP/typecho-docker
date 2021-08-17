FROM php:fpm-alpine
LABEL maintainer="i@indexyz.me"


RUN apk --update --no-cache add nginx unzip wget curl-dev libcurl git && \
  docker-php-ext-install pdo pdo_mysql bcmath curl && \
  mkdir -p /var/www/html/typecho && \
  wget http://typecho.org/build.tar.gz -O typecho.tgz && \
  tar zxvf typecho.tgz && \
  mv build/* /var/www/html/typecho && \
  rm -f typecho.tgz \
  chown -R www-data:www-data /var/www

# COPY plugins.sh /plugins.sh 
# RUN chmod +x /plugins.sh && \
#   sh /plugins.sh

COPY run.sh /run.sh
RUN chmod +x /run.sh

# COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80  

ENTRYPOINT [ "sh", "/run.sh" ]