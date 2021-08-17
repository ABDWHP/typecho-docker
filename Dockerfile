FROM php:fpm-alpine    
LABEL maintainer="i@indexyz.me"

# remove pdo,mbstring
RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install  pdo_mysql bcmath curl && \
  mkdir -p /var/www/html/typecho && \
  wget http://typecho.org/build.tar.gz -O typecho.tgz && \
  tar zxvf typecho.tgz && \
  mv build/* /var/www/html/typecho && \
  rm -f typecho.tgz  


COPY plugins.sh /plugins.sh 
RUN chmod +x /plugins.sh && \
  sh /plugins.sh

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80  

ENTRYPOINT [ "sh", "/run.sh" ]