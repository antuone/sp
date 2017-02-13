#!/bin/bash
ftp_user="ekb"
ftp_password="cb4yb5wf"
ftp_ip="127.0.0.1"
mkdir /mnt/ftp
curlftpfs ${ftp_user}:${ftp_password}@${ftp_ip}/ /mnt/ftp -o allow_other
mkdir /mnt/disk
mount -o uid=1000,iocharset=utf8 "$11" /mnt/disk
su anton -c "export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/disk1.sh'"
umount /mnt/disk
rmdir /mnt/disk
umount /mnt/ftp
rmdir /mnt/ftp
