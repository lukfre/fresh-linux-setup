#!/bin/bash -e
# Script to set up GitHub with vscode in a fresh linux installation
# AUTHOR: lukfre
# LAST UPDATE: 09/12/2024
# VERSION: 3.0

# GitHub pubkeys
GITHUB_ED25519="AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
GITHUB_ECDSA="AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
GITHUB_RSA="AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="


cd ~
echo ">> Setup Git with vscode?"
echo -n "   [y/*]: "
read git_vscode_flag
if [ $git_vscode_flag = 'y' ] || [ $git_vscode_flag = 'Y' ]; then
    echo ">> Installing git and vscode..."
    sudo apt-get install git-all
    sudo snap install code --classic

	# config global git variables
    while :
        echo -n ">> Write your Git username:  "
        read username
        echo -n ">> Write your Git email:     "
        read email
        
        echo "*************************************************"
        echo "$ git config --global user.name   '$username'"
        echo "$ git config --global user.email  '$email'"
        echo "*************************************************"
        echo ">? Proceed ? [y/*]"
        read flag
        if [ $flag = 'y' ] || [ $flag = 'Y' ]; then
            break
        fi
    done
    git config --global user.name  "$username"
    git config --global user.email "$email"
    echo ""


	# steps from https://docs.github.com/en/authentication/connecting-to-github-with-ssh
	FILE=~/.ssh/id_ed25519.pub
	if test -f "$FILE"; then
		echo ">> $FILE exists; there's already a SSH key"
	else
		echo ">> $FILE DOES NOT exists; creating new key..."
		echo "$ ssh-keygen -t ed25519 -C '$email'"
		ssh-keygen -t ed25519 -C "$email"
	fi
	echo ""


	# add GitHub pubkeys to the list of known hosts
	FILE=~/.ssh/known_hosts 
	if test -f "$FILE"; then
		echo ">> $FILE exists; adding GitHub pubkeys.."
	else
		echo ">> $FILE does not exist yet; creating it..."
		touch $FILE
	fi

	echo ">> adding list of know hosts from https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints"

    # add GitHub pubkeys to the list of known hosts
	echo "github.com ssh-ed25519 $GITHUB_ED25519" >> $FILE
	echo "        >> added github.com ssh-ed25519"

	echo "github.com ecdsa-sha2-nistp256 $GITHUB_ECDSA" >> $FILE
	echo "        >> added github.com ecdsa-sha2-nistp256"

	echo "github.com ssh-rsa $GITHUB_RSA" >> $FILE
	echo "        >> added github.com ssh-rsa"
	echo ""
	
	echo ">> content of $FILE:"
	echo ""
	cat $FILE
	echo ""

	echo ">> Remember to copy this line to a new GitHub SSH Key <<"
	cat ~/.ssh/id_ed25519.pub
	echo ">> Done! <<"
	echo ""
	echo -n ">? Log now into GitHub ?" 
    echo -n "   [y/*]: "
	read log_flag
	if [ $log_flag = 'y' ] || [ $log_flag = 'Y' ]; then
		firefox https://github.com
	fi
	echo ">> Opening vscode ..."
	code &
fi