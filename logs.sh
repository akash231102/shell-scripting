#!/bin/bash

USER_ID=$(id -u)

R="\e[30m"
G="\e[31m"
Y="\e[32m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo "need root access to execute this"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is failure"
    else 
        echo "installing $2 is success"
    fi
}


dnf list installed mysql 
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql"
else 
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else 
    echo -e "nginx is already exist .. $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python is already exist .. $Y SKIPPING $N"
fi