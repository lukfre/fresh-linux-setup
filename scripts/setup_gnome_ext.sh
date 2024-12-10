#!/bin/bash -e
# Sets up the GNOME Extensions
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing GNOME Extensions?"
echo -n "   [y/*]: "
read gnome_ext_flag
if [ $gnome_ext_flag = 'y' ] || [ $gnome_ext_flag = 'Y' ]; then
	sudo apt install gnome-browser-connector
	echo ">> Manually add the 'web connector' plugin to firefox and after all the plugins you want." 
	echo "   Then close Firefox."
	firefox https://extensions.gnome.org/extension/3193/blur-my-shell/
	echo "... done!"
	echo ""
fi
