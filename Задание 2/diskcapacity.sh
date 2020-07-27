#! /bin/bash

if [ $# -ne 1 ]
then
	echo "Укажите один из дисков для проверки:"
	df -h | grep "^/dev/" | cut -f 1 -d ' '
	exit
fi

disk=$1

echo "Прцент использования диска:"
q=$(df -h | grep $disk | tr -s [:blank:] | cut -f 5 -d ' ' | tr -d '%')

echo $q

if [ $q -ge 90 ]
then
	echo "Вероятно следует почистить диск"
fi
