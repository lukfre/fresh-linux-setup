#!/bin/bash -e
# Installs miniconda
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
echo ">? Installing miniconda?" 
echo "   more info: https://docs.conda.io/projects/miniconda/en/latest/miniconda-install.html"
echo -n "   [y/*]: "
read conda_flag
if [ $conda_flag = 'y' ] || [ $conda_flag = 'Y' ]; then
	mkdir -p ~/miniconda3
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
	bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
	rm -rf ~/miniconda3/miniconda.sh
	~/miniconda3/bin/conda init bash
	echo "... done!"
	echo ""
    echo "# solves problem with matplotlib in miniconda" >> ~/.bashrc 
    echo "export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6" >> ~/.bashrc
fi
