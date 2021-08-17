> Typecho Docker Image
# typecho Docker 镜像
Typecho 是一个轻量级的 php 博客系统，就像 wordpress 一样，具有插件支持。

这个repo提供了运行的基本环境typecho

# Quick start

## docker

```bash

docker run -d -p 80:80 cikiche/typecho-docker:stable

```

## docker-compose 

```bash
docker-compose up -d
```



# 特色
## 说明
1. 增加插件仓库。后台登陆完成后，直接启用插件仓库
2. 相比其它用户的来说：增加 docker-compose

2. 代码里面不含 mysql ，如果需要，请自行安装。

3. PHP 7.2.10 +  nginx/1.14.2
4. 代码目录为 容器内 */var/www/html/typecho*
5. nginx 配置为 /etc/nginx/nginx.conf (容器内) 。
6. nginx 域名配置目录为 /etc/nginx/conf.d (容器内)

## 示例网站
部署网站为 [http://blog.2pp.link](http://blog.2pp.link) 

## End
如果对您有用，请帮忙点个 star