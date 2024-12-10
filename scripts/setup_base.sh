#!/bin/bash -e
# Perform some basic installations in a fresh Linux environment
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing basic components?"
echo "   -  git                         (apt)"
echo "   -  curl                        (apt)"
echo "   -  vscode                      (snap)"
echo "   -  gparted                     (apt)"
echo "   -  telegram                    (snap)"
echo "   -  shotwell                    (apt)"
echo "   -  gnome-weather               (apt)"
echo -n "   [y/*]: "
read basic_flag
if [ $basic_flag = 'y' ] || [ $basic_flag = 'Y' ]; then
	sudo apt-get install git-all curl shotwell gnome-weather gparted
	sudo snap install code --classic
	sudo snap install telegram-desktop
	echo "... done!"
	echo ""
	echo ">> Pick your city in gnome-weather, then close it."
	gnome-weather
fi
