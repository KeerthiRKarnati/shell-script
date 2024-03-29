#!/bin/bash

ID=$(id -u)

#echo "$ID"

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run script with root access"
    exit 1 #other than zero
else
    echo "You are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Error:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is success"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing git is failed"
    exit 1
else
    echo "Installing git is success"
fi