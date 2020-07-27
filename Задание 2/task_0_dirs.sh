#! /bin/bash

for ((i=0;i<50;i++))
do
	mkdir "dir_$i"
	cd "dir_$i"

	for ((j=0;j<100;j++))
	do
		mkdir "subdir_$j"
		cd "subdir_$j"

		for ((k=0;k<200;k++))
		do
			touch "emptyfile_$k"
		done

		cd ..
	done
	
	cd ..
done
