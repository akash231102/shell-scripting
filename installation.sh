#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "needs root access to execute the script"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "installing mysql is failed"
    exit 1
else
    echo "installing mysql is success"
fi

