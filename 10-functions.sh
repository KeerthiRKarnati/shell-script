#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "Error:: Installing is failed"
        exit 1 #if error arises you can't proceed, give other than zero
    else
        echo "Installing is success"
    fi
}

if [ $ID -ne 0 ]
then 
    echo "Error:: Please run the script with root user"
    exit 1 #if error arises you can't proceed, give other than zero
else
    echo "You are root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE