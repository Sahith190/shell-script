#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGSDIR=/home/centos/shellscript-logs
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

USERID=$(id -u)
R="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run the script with Root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $R SUCCESS $N"
    fi
}

# all args are in $@

for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed ,lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done