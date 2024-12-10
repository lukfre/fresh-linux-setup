#!/bin/bash -e
# Installs Obsidian
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing Obsidian from https://help.obsidian.md/Getting+started/Download+and+install+Obsidian ?"
echo -n "   [y/*]: "
read obsidian_flag
if [ $obsidian_flag = 'y' ] || [ $obsidian_flag = 'Y' ]; then
	wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/obsidian_1.4.16_amd64.snap
	snap install obsidian_1.4.16_amd64.snap --dangerous --classic
	rm -f obsidian_1.4.16_amd64.snap
	echo "... done!"
	echo ""
fi
