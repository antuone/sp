#!/bin/bash

USER="anton"
ftp_user="ekb"
ftp_password="cb4yb5wf"
ftp_ip="127.0.0.1"

mkdir /etc/udev/rules.d/sp

echo '#!/bin/bash' >> /etc/udev/rules.d/sp/disk.sh
echo "ftp_user='$ftp_user'" >> /etc/udev/rules.d/sp/disk.sh
echo "ftp_password='$ftp_password'" >> /etc/udev/rules.d/sp/disk.sh
echo "ftp_ip='$ftp_ip'" >> /etc/udev/rules.d/sp/disk.sh
echo 'mkdir ~/ftp' >> /etc/udev/rules.d/sp/disk.sh
echo 'curlftpfs ${ftp_user}:${ftp_password}@${ftp_ip}/ ~/ftp -o allow_other' >> /etc/udev/rules.d/sp/disk.sh
echo 'mkdir /mnt/disk' >> /etc/udev/rules.d/sp/disk.sh
echo 'mount -o uid=1000,iocharset=utf8 "$11" /mnt/disk' >> /etc/udev/rules.d/sp/disk.sh
echo "su $USER -c \"export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/disk1.sh'\"" >> /etc/udev/rules.d/sp/disk.sh
echo 'umount /mnt/disk' >> /etc/udev/rules.d/sp/disk.sh
echo 'rmdir /mnt/disk' >> /etc/udev/rules.d/sp/disk.sh
echo 'umount ~/ftp' >> /etc/udev/rules.d/sp/disk.sh
echo 'rmdir ~/ftp' >> /etc/udev/rules.d/sp/disk.sh

echo '#!/bin/bash' >> /etc/udev/rules.d/sp/mtp.sh
echo 'ftp_user="ekb"' >> /etc/udev/rules.d/sp/mtp.sh
echo 'ftp_password="cb4yb5wf"' >> /etc/udev/rules.d/sp/mtp.sh
echo 'ftp_ip="127.0.0.1"' >> /etc/udev/rules.d/sp/mtp.sh
echo 'mkdir /mnt/ftp' >> /etc/udev/rules.d/sp/mtp.sh
echo 'curlftpfs ${ftp_user}:${ftp_password}@${ftp_ip}/ /mnt/ftp -o allow_other' >> /etc/udev/rules.d/sp/mtp.sh
echo "su $USER -c \"export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/mtp1.sh \$1 \$2'\"" >> /etc/udev/rules.d/sp/mtp.sh
echo 'umount /mnt/ftp' >> /etc/udev/rules.d/sp/mtp.sh
echo 'rmdir /mnt/ftp' >> /etc/udev/rules.d/sp/mtp.sh

cp disk1.sh /etc/udev/rules.d/sp/disk1.sh
cp mtp1.sh /etc/udev/rules.d/sp/mtp1.sh
cp usb.rules /etc/udev/rules.d/usb.rules

chmod +x /etc/udev/rules.d/usb.rules
chmod +x /etc/udev/rules.d/sp/disk.sh
chmod +x /etc/udev/rules.d/sp/mtp.sh
chmod +x /etc/udev/rules.d/sp/disk1.sh
chmod +x /etc/udev/rules.d/sp/mtp1.sh

apt-get install curlftpfs
apt-get install zenity
apt-get install jmtpfs
