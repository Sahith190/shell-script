#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)
#functions using
VALIDATE(){
   if [ $1 -ne 0 ]
then
   echo "$2... FAILURE"
   exit 1
else
   echo "$2... SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
   echo "plse run this script"
exit 1
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "INSTALLATION MYSQL SUCCESS"


yum install postfix -y &>>$LOGFILE

VALIDATE $? "INSTALLATION POSTFIX SUCCESS"