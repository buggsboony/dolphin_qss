#!/bin/bash

#install stuff #name is dolphin (will replace real dolphin)
what=dolphin 
extension=.sh
## Préparation à Créer le répertoire de configuration
confDir=~/.config/dolphin

#Installer  le nécessaire à l'utilisation de stylsheet
sudo pacman qt5ct -S  

#peut être extension vide
echo "Set executable..."
chmod +x $what$extension

#Replacer Dolphin if not already exists
dolbak=/usr/bin/dolphin_bak
if [ -f "$dolbak" ];
then
    echo "File '$dolbak' already exists ";
    echo "Mission aborted."
else
    echo "Backing up dolphin executable to '$dolbak'"
    sudo mv /usr/bin/dolphin $dolbak
    #copy qss file to 
    echo "Copying qss file to '$confDir'"
    mkdir -p $confDir
    cp $what.qss $confDir/$what.qss
    #echo "lien symbolique vers usr bin"
    sudo ln -s "$PWD/$what$extension" /usr/bin/$what
    echo "done."
fi