#!/bin/bash

COUNTER=0
error_logfile="url_errors.log"
count=`wc -l < $1`

for i in $( sed -n -e "1, $count p" $1 ); do
    ((COUNTER++))
	echo "counter: $COUNTER"
   	wget --spider -qO- $i
	
	RESULT=$?
        if [[ $RESULT -ne 0 ]]; then
            echo "File doesn't exist: $i" >> $error_logfile 2>&1
            echo "Status: $RESULT"
        fi
    
done
