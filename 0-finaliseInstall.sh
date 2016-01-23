#!/bin/bash


#We fetch the application
cd /opt/cheatProofTest/

#enter the virtual environnement
source bin/activate

#clone the project
git clone https://github.com/karlito139/dsCreator.git

#Put the new settings in place
cd dsCreator/dsCreator/
mv settings.py settings.py_debug
mv settings.py_realease settings.py

echo ""
echo "Application downloaded. You now need to create the DB and configure it in the settings file."
echo ""
echo "nano /opt/cheatProofTest/dsCreator/dsCreator/settings.py"

deactivate
