#!/bin/bash -eux

#source : https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04



#Create a virtual environnement for the web site
#mkvirtualenv cheatProofTest

#Install django in the virtual environnement
#pip install django

#We create the new project at the home of the environnement
#cd ~
#django-admin.py startproject cheatProofTest
#cd ~/cheatProofTest

#We create the DB for the app
#./manage.py migrate

#We create the super user
#./manage.py createsuperuser



#source : https://www.vultr.com/docs/setup-django-on-debian-8

#the nounset thingth are to prevent the _OLD_VIRTUAL_PATH: unbound variable error : https://github.com/pypa/virtualenv/issues/150
set -o nounset

#Set up the virtual environnement folder
mkdir -p /opt/cheatProofTest

#We go there
cd /opt/cheatProofTest

#And we strat a new environnement
virtualenv . -p python

#We enter the virtual environnement
set +o nounset
source bin/activate
set -o nounset

#We install django gunicorn
pip install django
pip install gunicorn
#pip install psycopg2
pip install djangular

#maybe : python-mysql.connector
apt-get install -y python-mysqldb libmysqlclient-dev python-dev
pip install mysqlclient

#need user password
#git clone https://github.com/karlito139/dsCreator.git

#Need to create the DB

#edit setting.py (use the release version)
#cd dsCreator/dsCreator/
#mv settings.py settings.py_debug
#mv settings.py_realease settings.py

#create the static folder
#cd ..
#mkdir static


#./manage.py makemigrations
#./manage.py migrate
#./manage.py createsuperuser
#./manage.py collectstatic


#http://askbot.org/en/question/11851/valueerror-the-database-backend-does-not-accept-0-as-a-value-for-autofield/


#Deploy the app itself
#cd ~
#django-admin.py startproject cheatProofTest
#cd ~/cheatProofTest

#./manage.py migrate
#./manage.py createsuperuser

#edit the settings.py file

#./manage.py collectstatic


#Finaly we deactivate the virtual environnement
set +o nounset
deactivate
set -o nounset
