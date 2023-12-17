#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "Error:: $2 ... failed"
        exit 1 #if error arises you can't proceed, give other than zero
    else
        echo "$2 ... success"
    fi
}

if [ $ID -ne 0 ]
then 
    echo "Error:: Please run the script with root user"
    exit 1 #if error arises you can't proceed, give other than zero
else
    echo "You are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"