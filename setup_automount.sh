#!/bin/bash
pname=$(mount | grep DATA)
pname=${pname/\/dev\//}
pname=${pname%%' '*}
echo "> Is the partition name $pname correct? [y/*]" 
read pname_flag
if [ $pname_flag = 'y' ] || [ $pname_flag = 'Y' ]; then
    echo "> Creating automount command..."
    uuid=$(ls -al /dev/disk/by-uuid/ | grep $pname)
    uuid=${uuid##* }
    uuid=${uuid/..\/..\//}
    echo "> Is the UUID $uuid correct ? [y/*]"
    read uuid_flag
    if [ $uuid_flag = 'y' ] || [ $uuid_flag = 'Y' ]; then
        udisksctl mount --block-device /dev/disk/by-uuid/$uuid 
        echo ">> Copy this command in the starting applications to automount the disk on startup."
    else
        echo "> Please, check the UUID and try again. The command is:"
        echo "udisksctl mount --block-device /dev/disk/by-uuid/$uuid"
    fi
else
    echo "> Please, check the partition name and try again."
fi
