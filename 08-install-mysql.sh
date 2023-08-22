#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "plse run this script"
exit 1
fi

yum install mysql -y

if [ $? -ne 0 ]
then
   echo "Installation of mysql is error"
   exit 1
else
   echo "Instalation of mysql is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
   echo "Installation of postfix is error"
   exit 1
else
   echo "Instalation of postfix is success"
fi