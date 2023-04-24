#!/bin/bash


Hello(){
	echo "hello!!! $1"
	echo "Script Name: $0"
	echo "Number of args: $#"
	echo "All args are: $@"
}

echo "Before calling function, checking name: $NAME"
echo "Script Name: $0"
echo "Number of args: $#"
echo "All args are: $@"
echo 
Hello $1

#parameters passed to the script are by default not accessible inside functions
