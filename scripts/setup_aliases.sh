#!/bin/bash -e
# Sets up some aliases in the .bash_aliases file
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0
#
cd ~
ALIASES_FILE=".bash_aliases"
if ! test -f "$ALIASES_FILE"; then
    echo ">> $ALIASES_FILE does not exist yet; creating it..."
    touch $ALIASES_FILE
fi
echo ">? Installing apt-routine (upgrade, update, autoremove, clean) ?"
echo -n "   [y/*]: "
read aliases_flag
if [ $aliases_flag = 'y' ] || [ $aliases_flag = 'Y' ]; then
    echo "# apt-routine - upgrade, update, autoremove, clean" >> $ALIASES_FILE
    printf $"function apt-routine ()" >> $ALIASES_FILE  
    printf $"\n{" >> $ALIASES_FILE
    printf $"\n\techo >> \"Upgrading & updating...\"" >> $ALIASES_FILE
    printf $"\n\tsudo apt-get upgrade && sudo apt-get update" >> $ALIASES_FILE
    printf $"\n\techo >> \"Cleaning up space...\"" >> $ALIASES_FILE
    printf $"\n\tsudo apt-get autoremove" >> $ALIASES_FILE
    printf $"\n\tsudo apt-get clean" >> $ALIASES_FILE
    printf $"\n\techo ">> ... done!"" >> $ALIASES_FILE
    printf $"\n}\n\n" >> $ALIASES_FILE
fi
