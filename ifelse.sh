#!/bin/bash

time=$(date +%H)

if [ "$time" -lt 12]; then
    message="good morning user"
elif [ "$time" -lt 18]; then
    message="good afteroon user"
else
    message="good evening user"
fi
echo "$message"


