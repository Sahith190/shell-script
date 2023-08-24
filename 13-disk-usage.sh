#!/bin/bash

#colors
#validations
#Log redirections

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1

#IFS = Internal field separater is space

while IFS= read line
do
    echo "output $line"

done <<< $DISK_USAGE


