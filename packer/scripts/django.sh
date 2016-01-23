#!/bin/bash -eux

#source : https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04

#It is that simple
#apt-get -y install python-pip

#pip install virtualenv virtualenvwrapper

#echo "export WORKON_HOME=~/Env" >> ~/.bashrc
#echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2" >> ~/.bashrc
#echo "export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2" >> ~/.bashrc

#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

#source ~/.bashrc


#source : https://www.vultr.com/docs/setup-django-on-debian-8
apt-get -y install python-pip virtualenv


# cat <<EOF > /etc/systemd/system/django.service
# [Unit]
# Description=Django with Gunicorn
# After=network.target
#
# [Service]
# User=root
# Group=root
# WorkingDirectory=/opt/project/project
# ExecStart=/opt/project/bin/gunicorn --workers 3 --bind 127.0.0.1:8000 project.wsgi
#
# [Install]
# WantedBy=multi-user.target
# EOF
#
# systemctl enable django.service



##################
#		uWSGI
##################

apt-get install -y python-dev

pip install uwsgi

mkdir -p /etc/uwsgi/sites
cd /etc/uwsgi/sites

#configuration file
cat <<EOF > /etc/uwsgi/sites/cheatprooftest.ini
[uwsgi]
project = dsCreator
base = /opt/cheatProofTest

chdir = %(base)/%(project)
home = %(base)/Env/%(project)
module = %(project).wsgi:application

master = true
processes = 5

socket = %(base)/%(project)/%(project).sock
chmod-socket = 664
vacuum = true
EOF



#startup file
cat <<EOF > /etc/init/uwsgi.conf
description "uWSGI application server in Emperor mode"

start on runlevel [2345]
stop on runlevel [!2345]

setuid user
setgid www-data

exec /usr/local/bin/uwsgi --emperor /etc/uwsgi/sites
EOF



##################
#		Nginx
##################

cat <<EOF >/etc/nginx/sites-available/cheatprooftest
server {
    listen 80;
    server_name cheatprooftest.com www.cheatprooftest.com;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /opt/cheatProofTest/dsCreator/;
    }

    location / {
        include         uwsgi_params;
        uwsgi_pass      unix:/opt/cheatProofTest/dsCreator/cheatProofTest.sock;
    }
}

EOF

ln -s /etc/nginx/sites-available/cheatprooftest /etc/nginx/sites-enabled/cheatprooftest





service nginx restart
#service uwsgi start
