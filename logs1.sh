#!/bin/bash

USER_ID=$(id -u)
LOG_DIR=/var/logs/shell-script
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log"

mkdir -p $LOG_DIR
echo " script started executed at $(date) "
if [ USER_ID -ne 0 ]; then
    echo -e " $R need root access to execute this script $N" | tee -a $LOG_FILE
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "installing $2 is failed "
    else   
        echo "installing $2 is success"
    fi
}

dnf list installed mysql >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y >>$LOG_FILE
    validate $? "mysql"
else 
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y >>$LOG_FILE
    validate $? "nginx"
else 
    echo -e "nginx is already exist .. $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 >>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y >>$LOG_FILE
    validate $? "python3"
else
    echo -e "python is already exist .. $Y SKIPPING $N" | tee -a $LOG_FILE
fi

