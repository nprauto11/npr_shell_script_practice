#!/bin/bash

read -p "Enter db username? : " USER_NM
echo -n "Enter db password? : "
read -s USER_PW

echo "Your db username is: ${USER_NM}"
echo "and your db password is: ${USER_PW}"