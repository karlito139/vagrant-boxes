#!/bin/bash -eux

apt-get update
apt-get -y upgrade



#############################
#		dafuk old school
#############################
# ensure the correct kernel headers are installed
#apt-get -y install linux-headers-$(uname -r)

# update package index on boot
#cat <<EOF > /etc/init/refresh-apt.conf
#description "update package index"
#start on networking
#task
#exec /usr/bin/apt-get update
#EOF

# install curl to fix broken wget while retrieving content from secured sites
#apt-get -y install curl

# install rsync
#apt-get -y install rsync


#############################
#		To test
#############################
apt-get -y install sudo

#TODO : preanswear the questions
#adduser karlito

#Add new user to the sudo group
#pgasswd -a karlito sudo



#TODO : Add ssh connexion : https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04



#TODO : Add yubikey verification



#TODO : disable root login in ssh



service ssh restart


