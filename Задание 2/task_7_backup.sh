#! /bin/bash

echo "Добро пожаловать в планировщик резервных копий!"
echo "1. Введите полный путь к копируемому файлу или каталогу:"
read source_path

if [ -r $source_path ]
then
	echo "Принято!"
else
	echo "Путь не существует, либо не может быть прочитан"
	exit
fi

echo "2. Введите путь к директории назначения:"
read dist_path 

if [ -d $dist_path ]
then
	echo "Принято!"
else
	echo "Указанный путь не является директорией, либо не существует"
	exit
fi

echo "3. Создать Git-репозиторий в директории назначения? (y/n):"
read is_git

if [ "y" = $is_git ]
then
	cd $dist_path
	git init
	cd -
fi

echo "4. Укажите время создания копии в формате CRON (m h DOM M DOW):"
read cron_time

cron_rule+=$cron_time
cron_rule+=" zip -r -9 $dist_path/last_backup.zip $source_path # _backup_rule_
"

old_crontab=$(crontab -l)
cron_rule+=$old_crontab

echo "$cron_rule" > .backup.cron
crontab .backup.cron
unlink .backup.cron


