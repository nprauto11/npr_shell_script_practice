#!/bin/bash

USERID=$(id -u)

# check user is root or not 

if [ $USERID -ne 0 ]; then  
	echo "You need to be root user to execute this script"
	exit 1
fi

apt install git -y 

if [ $? -ne 0 ]; then 
	echo "Installing git is failure"
	exit 1 
else 
	echo "Installing git is Success"
fi	
