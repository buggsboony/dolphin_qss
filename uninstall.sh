#!/bin/bash

#install stuff
what=dolphin 
extension=.sh
#peut être extension vide 
 
echo "killing running instances"
killall $what

#check Dolphin if not already exists
dolbak=/usr/bin/dolphin_bak

if [ -f "$dolbak" ];
then
    echo "remove symbolic link from usr bin"
    sudo rm /usr/bin/$what

    echo "Revert '$dolbak' to '$what'"
    sudo mv $dolbak /usr/bin/dolphin
    echo "Ok.";

else
    echo "Not removing.. :(";
fi

echo "done."

