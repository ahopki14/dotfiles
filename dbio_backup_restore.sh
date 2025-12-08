#!/bin/bash
# Un-splits and untars a dbio backup to $PWD
# WARNING: UNTESTED!
BACKUP=$1
OUT=./$(basename $BACKUP).tar.gz
if [[ -d $BACKUP ]];then
        echo "extracting to $PWD"
        #unsplit and extract
        cat $BACKUP/dbio_backup_* | tar -xzf - 

else 
        echo "No such directory:$BACKUP"
fi
