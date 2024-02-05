#!/bin/bash
# usage:
# first run
# 	source retrieve.sh
# then any file in $STICKY_NOTES can be catted with e.g. 
# 	i my_sticky
if [[ -z $STICKY_NOTES ]]; then
	echo "please set STICKY_NOTES env to location of sticky notes"
fi

#the function
i(){
  cat $STICKY_NOTES/$1
}

#list of files available
l=$(ls $STICKY_NOTES | grep -v 'retrieve.sh')

#set the autocomplete
IFS='
'
complete -W "$l" i
