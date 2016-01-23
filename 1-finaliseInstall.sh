#!/bin/bash


cd /opt/cheatProofTest/dsCreator/

#create the static folder
mkdir static


./manage.py makemigrations
./manage.py migrate
./manage.py createsuperuser
./manage.py collectstatic


deactivate
