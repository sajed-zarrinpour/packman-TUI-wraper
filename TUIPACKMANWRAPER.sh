#!/bin/bash 
#display a list of all available packages using fzf, get the selected package
APPNAME=$(pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse)
#show a tui menu to choose the action
exec 3>&1;                                                       ✔ 
result=$(dialog --clear --menu "Available Options:" 12 45 25 1 "install" 2 "update" 3 "upgrade" 4 "remove" 2>&1 1>&3);
exitcode=$?;
exec 3>&-;
clear;
#taking action based on the user choice
case "$result" in
    1)
        # install
        sudo pacman -S $APPNAME;
    ;;

    2)
        # update
        sudo pacman -S $APPNAME;
    ;;

    3)
        # upgrade
        sudo pacman -S $APPNAME;
    ;;

    4)
        # remove
        sudo pacman -R $APPNAME;
    ;;
esac
