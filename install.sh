#!/bin/bash

USER="anton"

mkdir /etc/udev/rules.d/sp

echo "#!/bin/bash" >> /etc/udev/rules.d/sp/disk.sh
echo "mkdir /mnt/disk" >> /etc/udev/rules.d/sp/disk.sh
echo "mount -o uid=1000,iocharset=utf8 \"\$11\" /mnt/disk" >> /etc/udev/rules.d/sp/disk.sh
echo "su $USER -c \"export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/disk1.sh'\"" >> /etc/udev/rules.d/sp/disk.sh
echo "umount /mnt/disk" >> /etc/udev/rules.d/sp/disk.sh
echo "rmdir /mnt/disk" >> /etc/udev/rules.d/sp/disk.sh

echo "#!/bin/bash" >> /etc/udev/rules.d/sp/mtp.sh
echo "su $USER -c \"export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/mtp1.sh \$1 \$2'\"" >> /etc/udev/rules.d/sp/mtp.sh

cp disk1.sh /etc/udev/rules.d/sp/disk1.sh
cp mtp1.sh /etc/udev/rules.d/sp/mtp1.sh
cp usb.rules //etc/udev/rules.d/usb.rules
