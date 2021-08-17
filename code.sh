#!/bin/sh
set -e

# if command -v wget >/dev/null 2>&1; then 
# else 
#   yum install wget  -y
# fi

mkdir -p /var/www/html/typecho

cd ~

wget http://typecho.org/build.tar.gz -O typecho.tgz
tar zxvf typecho.tgz
mv build/* /var/www/html/typecho
rm -f typecho.tgz  

# 进入插件目录
cd /var/www/html/typecho/usr/plugins
# GistEcho plugins

mkdir -p GistEcho 
wget https://gist.githubusercontent.com/legendlee/4187609/raw/fe859e9b2fb98a600cf91203b5f5fe9ac06c7ceb/GistEcho.php \
    -O GistEcho/Plugin.php

# APlayer

git clone https://github.com/MoePlayer/APlayer-Typecho.git Meting

# Prism 

wget https://github.com/typecho-fans/plugins/releases/download/plugins-M_to_R/Prism.zip
unzip Prism.zip
rm -f Prism.zip

# GitHub Cards

git clone https://github.com/chekun/typecho-github-card.git GithubCard

# Friends card

git clone https://github.com/Indexyz/FriendsCard.git FriendsCard

# Google Analytics

mkdir Analytics
wget https://gist.githubusercontent.com/Indexyz/c5b52f773eac14456d3385d3f58d8d4f/raw/70a75ad46f98991a853bc83bcd42a20ec9818ed7/Analytics_Plugin.php -O Analytics/Plugin.php

# Sitemap
git clone https://github.com/bayunjiang/typecho-sitemap.git
mv typecho-sitemap/Sitemap .
rm -rf typecho-sitemap

# CDN switch
# wget https://publish.indexyz.me/files/CDNSwitch.zip
# unzip CDNSwitch.zip
# rm -f CDNSwitch.zip

# 插件
wget  https://www.yzmb.me/download/2253 -O TeStore.zip
unzip TeStore.zip
rm -f TeStore.zip