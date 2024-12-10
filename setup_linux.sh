#!/bin/bash -e
# SCRIPT TO PERFORM SOME BASIC INSTALLATIONS IN A FRESH LINUX ENVIRONMENT
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
echo ">> UBUNTU FRESH INSTALL SETUP HELPER v3.0 <<"
echo ">> Tested on Ubuntu 24.02 64bit w/ kernel Linux 6.8.0-49-generic"
echo ">> Made w/ <3 by lukfre :]"
echo ""

ORIGINAL_DIR=$(pwd)
echo ">> Execute this script from its directory otherwise it will fail !!"
echo ">> Current directory: $ORIGINAL_DIR"
echo ""

sudo apt-get update
echo ">> Do you want to upgrade the system?"
echo -n "   [y/*]: "
read upgrade_flag
if [ $upgrade_flag = 'y' ] || [ $upgrade_flag = 'Y' ]; then
    echo ">> Upgrading system..."
    sudo apt-get upgrade
    echo "... done!"
    echo ""
fi


# INSTALLING BASIC COMPONENTS
source $ORIGINAL_DIR/scripts/setup_base.sh

# INSTALLING GNOME EXTENSIONS
source $ORIGINAL_DIR/scripts/setup_gnome_ext.sh

# INSTALLING MINICONDA
source $ORIGINAL_DIR/scripts/setup_miniconda.sh

# INSTALLING SPOTIFY AND SPOTX (to remove ads)
source $ORIGINAL_DIR/scripts/setup_spotify.sh

# INSTALLING OBSIDIAN
source $ORIGINAL_DIR/scripts/setup_obsidian.sh

# INSTALLING ZOTERO
source $ORIGINAL_DIR/scripts/setup_zotero.sh

# SETUP GIT && VSCODE
source $ORIGINAL_DIR/scripts/setup_vscode_git.sh

# Install custom aliases
source $ORIGINAL_DIR/scripts/setup_aliases.sh

# Custom HuggingFace Dataset cache dir
source $ORIGINAL_DIR/scripts/setup_hf_cache.sh

sudo apt-get autoremove
sudo apt clean

# end
echo ""
echo ">> Bye :)"
echo ""
