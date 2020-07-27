#! /bin/bash

if [ $# -ne 4 ] 
then
	echo "Используйте: $0 <path> <dir_count> <subdir_count> <emptyfile_count>"
	exit
fi

path=$1
dir_count=$2
subdir_count=$3
files_count=$4

if [[ $dir_count -le 0 || $subdir_count -le 0 || $files_count -le 0 ]]
then
	echo "Нельзя указывать отрицательные или нулевые параметры"
	exit
fi

if [ -d $path ]
then
	cd $path	
else
	echo "Путь $path не является директорией"
	exit
fi

for (( i = 0 ; i < $dir_count ; i++ ))
do
	mkdir "dir_$i"
	cd "dir_$i"

	for (( j = 0 ; j < $subdir_count ; j++ ))
	do
		mkdir "subdir_$j"
		cd "subdir_$j"

		for (( k = 0 ; k < $files_count ; k++ ))
		do
			touch "file_$k"
		done

		cd ..
	done

	cd ..
done

