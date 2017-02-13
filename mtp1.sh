#!/bin/bash

folder_home="Изображения/Фото пломб"

folder=$(zenity --title "Обнаружена USB камера" --entry --text \
"Введите название папки для сохранения фотографий с этой камеры\n \
Папка с фотографиями сохранится в деррикторию /home/$USER/$folder_home\n \
После сохранения все фотографии из папки DCIM будут УДАЛЕНЫ!")

if [ $? -eq "0" ]
then
	(
	mkdir /home/${USER}/mtp
	jmtpfs /home/${USER}/mtp -device=$1,$2

	mkdir "/home/$USER/Изображения"
	mkdir "/home/$USER/$folder_home"
	mkdir "/home/$USER/$folder_home/$folder"
	cp -R /home/${USER}/mtp/Внутренняя\ память/DCIM/* "/home/$USER/$folder_home/$folder"
	rm -rf /home/${USER}/mtp/Внутренняя\ память/DCIM/*

	fusermount -u /home/${USER}/mtp
	rmdir /home/${USER}/mtp
	sleep 3
	) |
	zenity --progress \
	  --title="Перемещение фалов" \
	  --text="Файлы перемещаются в папку /home/$USER/$folder_home/$folder" \
	  --percentage=0

fi




