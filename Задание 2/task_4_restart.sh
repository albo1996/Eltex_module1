#! /bin/bash

if [ $# -e 1 ]
then

	proc_name=$(ps -x | grep "$2")

	if [ -z $proc_name ]
	then
		$proc_name
	fi

elif [ $# -e 2 ]
then
	cron_rule="*/$1 * * * * $0 $2"
	echo "$cron_rule" > .restart.cron
	crontab .restart.cron
	unlink .restart.cron
else
	echo "Используйте:"
	echo "$0 <период> <имя>"
fi
