#!/bin/bash

lss -ltr  # it is failure so it will not execute further, as per below if condition it will exit loop 

if [ $? -ne 0 ]; then  
   echo "previous command is failure"
   exit 1
fi

