#!/bin/bash -e
# Installs Zotero
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing Zotero from https://www.zotero.org/download/ ?"
echo -n "   [y/*]: "
read obsidian_flag
if [ $obsidian_flag = 'y' ] || [ $obsidian_flag = 'Y' ]; then
	echo ">> Download Zotero for Linux in /home, then close firefox to proceed."
	firefox https://www.zotero.org/download/
	# extract through pattern matching, xargs sends the output of ls to the next command
	ls ./Zotero*.tar.bz2 | xargs tar -xvf
	ls ./Zotero*.tar.bz2 | xargs rm -rf
	# renaming for shortness
	mv ./Zotero* zotero
	# update launcher icon and make it appear on the dashboard
	~/zotero/set_launcher_icon
	ln -s ~/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
	echo ">> Zotero folder created in /home/Zotero."
	echo "... done!"
	echo ""
fi