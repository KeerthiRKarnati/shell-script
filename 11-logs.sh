#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "Script started executed at $Y $TIMESTAMP $N" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo  -e "Error:: $2 ... $R FAILED $N"
        exit 1 #if error arises you can't proceed, give other than zero
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R Error:: Please run the script with root user $N"
    exit 1 #if error arises you can't proceed, give other than zero
else
    echo -e "You are $G root $N user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"

echo -e "Script Ended executed at $Y $TIMESTAMP $N" &>> $LOGFILE