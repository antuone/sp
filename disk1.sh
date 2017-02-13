#!/bin/bash

R=$(ls /mnt/ftp -l|grep '^d'| awk '{print $9}')
R=$(zenity --list \
  --title="Обнаружено USB устройство" \
  --text="Для сохранения фоток выберите Рейс, а потом партию." \
  --column="Рейс" ${R})

if [ $? -eq "1" ]
then
    exit
fi

P=$(ls /mnt/ftp/${R} -l|grep '^d'| awk '{print $9}')
P=$(zenity --list \
  --title="Обнаружено USB устройство" \
  --text="Веберите партию." \
  --column="Партия" ${P})

if [ $? -eq "1" ]
then
    exit
fi

ZV=$(zenity --list \
  --title="Обнаружено USB устройство" \
  --text="Загрузка или Выгрузка" \
  --column="Направление"\
  Загрузка Выгрузка)

if [ $? -eq "1" ]
then
    exit
fi

(
	echo "0"
    cp -R /mnt/disk/* /mnt/ftp/${R}/${P}/${ZV}
	echo "50"
    rm -rf /mnt/disk
	echo "90"
    sleep 3
	echo "100"
) |
zenity --progress \
    --title="Перемещение фалов" \
    --text="Файлы перемещаются на сервер в папку $R/$P/$ZV" \
	--pulsate


