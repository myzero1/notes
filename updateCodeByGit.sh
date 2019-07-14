#!/bin/bash
successMsg="Already up-to-date."

while [ 1 -le 2 ]
do
	tmpMsg=$(git pull)

	if [[ "$tmpMsg" == "$successMsg" ]]
		then
		echo 111
	else
		echo 222
	fi

	# sleep 10s #秒
	sleep 1m #分
	# sleep 1h #时
done
