
Ref:- https://youtu.be/DiZA6lvom1c
      https://youtu.be/dkeEJm3b26k
      https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/
      

#!/bin/bash --> shebang 
  shebang should be the 1st line of script, it is the path of the interpreter/executor 
  
  
Variables
##########
1. variable is used to store value 
2. variables are useful to store dynamic data means changing value  


requirement
-----------
a. store values into variable and display it
b. pass the values/arguments to script, print it 
c. need to execute the command in shell script and take the output into variable 
d. user need to enter data when asked and stored inside variable 
e. ask username and password with silint feature. display them 

note: after writing script, provide execute permission 
      ex:-  chmod u+x script.sh
	  execute like:  ./script.sh 

(*) Exit status
###############
$? = 0      --> success 
$? = 1-127  --> failure 

by default script will proceed even previous command is failure
it is our responsiblity to check exit status and proceed 


Scenario:  Git installtion 
========
steps:
-----
1. check user id. if user id is 0 then he is root user 
2. other than 0, he is not root root 
3. create one variable USERID, take the output of id -u into it 
4. if USERID is 0 then install git 
5. else throw an error 


(*) Functions 
#############
1. set of work 
2. repeated usage 

  function_name (){
  
  	command 1
  	command 3
  }
  
  function_name 
  
  

now,here we are going to use, what we learned till now 
 i.e variables
     exit status 
	 conditions 
	 function 
	 
	 
scenario: Jenkins installation 
========

steps:
-----
1. check user is root or not 
2. if not root, exit user  
3. curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key |  tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
4.  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
5. check this command is success or not using exit status	
6. apt-get update -y
7. check this command is success or not using exit status
8. apt-get install fontconfig openjdk-11-jre -y
9. check this command is success or not using exit status
10. sudo apt-get install jenkins -y 
11. check this command is success or not using exit status
12. systemctl start jenkins
13. check this command is success or not using exit status
14. systemctl enable jenkins
15. check this command is success or not using exit status


############################################################

# ps commad will tell us which terminal we are in 

$ ps
    PID TTY          TIME CMD
   6100 pts/1    00:00:00 bash
   6214 pts/1    00:00:00 ps
   
$ which bash
/usr/bin/bash


conditional statements & loops & case 
#####################################

(*) conditional statements (if/else) --> if, if-else, if-elif-else
=============================
if [[ condition ]];
then
	statement
elif [[ condition ]]; then
	statement 
else
	do this by default
fi


# We can use logical operators such as AND -a and OR -o to make comparisons that have more significance.
    if [ $a -gt 60 -a $b -lt 100 ]
  This statement checks if both conditions are true: a is greater than 60 AND b is less than 100


ex:-
#!/bin/bash

echo "Please enter a number: "
read num

if [ $num -gt 0 ]; then
  echo "$num is positive"
elif [ $num -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi



(*) While loop
    ==========
While loops check for a condition and loop until the condition remains true. We need to provide a counter statement that increments the counter to control loop execution

ex-1:- below loop will run exactly 10 times

#!/bin/bash
i=1
while [[ $i -le 10 ]] ; do
   echo "$i"
  (( i += 1 ))
done


ex2:- read the each line from file named input.txt and prints it to the terminal. 

#!/bin/bash

while read line
do
  echo $line
done < input.txt


(*) For loop
    ========
The for loop, just like the while loop, allows you to execute statements a specific number of times. Each loop differs in its syntax and usage

ex-1:- below loop will iterate 5 times

#!/bin/bash

for i in {1..5}
do
    echo $i
done


(*) Case statements
    ===============
In Bash, case statements are used to compare a given value against a list of patterns and execute a block of code based on the first pattern that matches. The syntax for a case statement in Bash is as follows:

case expression in
    pattern1)
        # code to execute if expression matches pattern1
        ;;
    pattern2)
        # code to execute if expression matches pattern2
        ;;
    pattern3)
        # code to execute if expression matches pattern3
        ;;
    *)
        # code to execute if none of the above patterns match expression
        ;;
esac


ex-1:- in below code, value of "fruit" is "apple", the first pattern matches, and the block of code that echoes "This is a red fruit." is executed

fruit="apple"

case $fruit in
    "apple")
        echo "This is a red fruit."
        ;;
    "banana")
        echo "This is a yellow fruit."
        ;;
    "orange")
        echo "This is an orange fruit."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac



########################
important points
===========
1. we can set the shell script in cron
   * * * * * bash /opt/script.sh     #this will run at every minute   (min hour day-of-month month day-of-week) 

2. to edit contab entries, command "ctontab -e".
   to list cron entries, comand "crontab -l"

3. set the option "set -x" at the beginning of script, this will enables the debugging mode. Which causes Bash to print each commmand that it executes to the terminal 
   
   #!/bin/bash

   set -x

   # Your script goes here

4. check the exit code. When Bash encounter an error, it sets an exit ode that indicates the nature of error. with help of $? will get the previous command execution status. 0 indicates success 

5. use the echo statements through out our code. this help is to identify where errors are occuring 

6. use the option "set -e", when any command in the script fails, exit immediately 

    #!/bin/bash
    
    set -e
    
    # Your script goes here
	
7. Troubleshooting crons by veryfying logs. For ubuntu/debian, we can find cron logs at:  /var/log/syslog

