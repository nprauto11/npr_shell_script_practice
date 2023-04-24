

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
e. 

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
