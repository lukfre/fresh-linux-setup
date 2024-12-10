#!/bin/bash -e
# Installs Spotify
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing official Spotify (snap) ?"
echo -n "   [y/*]: "
read spotify_flag
if [ $spotify_flag = 'y' ] || [ $spotify_flag = 'Y' ]; then
	sudo snap install spotify
	echo "... done!"
	echo ""
else
	echo ">? Installing Spotify from https://www.spotify.com/us/download/linux/"
	echo -n "   [y/*]: "
	read spotify_flag
	if [ $spotify_flag = 'y' ] || [ $spotify_flag = 'Y' ]; then
		curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
		echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
		sudo apt-get update && sudo apt-get install spotify-client
		echo ""
	fi
	echo ">? Installing SpotX from https://github.com/SpotX-CLI ?"
	echo -n "   [y/*]: "
	read spotx_flag
	if [ $spotx_flag = 'y' ] || [ $spotx_flag = 'Y' ]; then
		echo ">> Log into Spotify, then close it."
		spotify
		bash <(curl -sSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/install.sh) -ce
		echo "... done!"
		echo ""
	fi
fi
