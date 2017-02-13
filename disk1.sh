#!/bin/bash

folder_home="Изображения/Фото пломб"

folder=$(zenity --title "Обнаружен USB диск" --entry \
--text "Введите название папки для сохранения всех фотографий с этого диска\n \
Папка с фотографиями сохранится в деррикторию /home/$USER/$folder_home\n \
После сохранения все файлы с устройства будут УДАЛЕНЫ!")

if [ $? -eq "0" ]
then
	(
	mkdir "/home/$USER/Изображения"
	mkdir "/home/$USER/$folder_home"
	mkdir "/home/$USER/$folder_home/$folder"
	cp -R /mnt/disk/* "/home/$USER/$folder_home/$folder"
	rm -rf /mnt/disk
	sleep 3
	) |
	zenity --progress \
	  --title="Перемещение фалов" \
	  --text="Файлы перемещаются в папку /home/$USER/$folder_home/$folder" \
	  --percentage=0

fi


