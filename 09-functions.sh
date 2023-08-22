#!/bin/bash

USERID=$(id -u)
#functions using
VALIDATE(){
   if [ $1 -ne 0 ]
then
   echo "Installation... FAILURE"
   exit 1
else
   echo "Instalation... SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
   echo "plse run this script"
exit 1
fi

yum install mysql -y

VALIDATE $? "INSTALLATION MYSQL SUCCESS"


yum install postfix -y

VALIDATE $? "INSTALLATION POSTFIX SUCCESS"