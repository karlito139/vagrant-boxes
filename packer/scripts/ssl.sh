#!/bin/bash -eux

#https://letsencrypt.org/
#https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-14-04

apt-get -y install git bc

git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

service nginx stop

cd /opt/letsencrypt

#debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect"
#./letsencrypt-auto certonly --standalone
