# setup-linux
Bash script containing my usual setup for fresh linux installation.

Open a terminal **in the repo folder**, launch the script and you're good to go.
```
$ cd /path/to/working_dir
$ git clone git@github.com:lukfre/setup-linux.git 
$ cd ./setup-linux
$ ./setup_linux.sh
```

The script will ask you to install stuff such as:
- git
- curl
- gparted
- vscode (you may need to install it by yourself using `--classic`)
- telegram
- shotwell
- gnome-weather
- gnome-browser-connector
- GNOME Extensions
- miniconda
- Spotify (and Spot-X)
- Obsidian
- Zotero

It will also ask you to setup the integration git-vscode (i.e., it drives you to creating a new SSH key etc.)

Feel free to modify to better suit your needs `:]`

# Connecting to a server without typing passwords
You need to copy the SSH key to the server so that you can connect passwordlessly.
**DO NOT** copy-paste the whole script!
```bash
# Check if you already have a RSA key
ls -lha ~/.ssh/ | grep id_rsa*

# If you don't have, create a new one
# you can leave everything blank when asked 
ssh-keygen -t rsa -b 4096

# Now you need to copy the SSH key to the server
# if you have the hostname in the ~/.ssh/config file
# otherwise just use username@host instead of hostname
ssh-copy-id hostname 

# ssh-copy-id is equivalent to this: 
# cat ~/.ssh/id_rsa.pub | ssh hostname "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

# check that the keys have been copied
ssh hostname | cat ~/.ssh/authorized_keys
```
