#!/bin/bash

VALIDATE(){
if [ $1 -ne 0 ]; then 
	echo "$2 .... Failure"
	exit 1
else
	echo "$2 ....  Success"
fi 
}

USERD=$(id -u)

if [ $USERID -ne 0 ]; then 
	echo "You need to be root user to execute this script"
	exit 1
fi 


curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null	
VALIDATE $? "Adding Jenkins Repo"

apt-get update -y
VALIDATE $? "Updating apt"

apt-get install fontconfig openjdk-11-jre -y
VALIDATE $? "Installing Java (Open-jdk"

sudo apt-get install jenkins -y 
VALIDATE $? "Installing Jenkins"

systemctl start jenkins
VALIDATE $? "Jenkins Service Starting"

systemctl enable jenkins
VALIDATE $? "Jenkins Service Enabling"


