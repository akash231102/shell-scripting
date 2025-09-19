#!/bin/bash

a=$(date +%s)

sleep 10

b=$(date +%s)

echo "time taken to executed the script :$(($a-$b))