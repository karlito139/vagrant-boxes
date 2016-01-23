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


cat <<EOF > /etc/systemd/system/django.service
[Unit]
Description=Django with Gunicorn
After=network.target

[Service]
User=root
Group=root
WorkingDirectory=/opt/project/project
ExecStart=/opt/project/bin/gunicorn --workers 3 --bind 127.0.0.1:8000 project.wsgi

[Install]
WantedBy=multi-user.target
EOF

systemctl enable django.service


##################
#		Nginx
##################

# cat <<EOF >/etc/nginx/sites-available/django
# server {
#         listen 80;
#         server_name www.cheatProofTest.com;
#         access_log off;

#         location /static/ {
#                 alias /opt/project/static/;
#         }

#         location / {
#                 proxy_pass http://127.0.0.1:8000;
#         }
# }
# EOF

#ln -s /etc/nginx/sites-available/django /etc/nginx/sites-enabled/django

#systemctl start nginx
