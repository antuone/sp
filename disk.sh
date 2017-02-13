#!/bin/bash
mkdir /mnt/disk
mount -o uid=1000,iocharset=utf8 "$11" /mnt/disk
su anton -c "export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/disk1.sh $1'"
umount /mnt/disk
rmdir /mnt/disk
