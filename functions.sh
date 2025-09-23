#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0]; then
    echo "needs sudo access to use"
    exit 1;
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "installing $2 is failed"
    exit 1
    else
        echo "installing $2 is success"
    fi
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install pyhton3 -y
validate $? "python"