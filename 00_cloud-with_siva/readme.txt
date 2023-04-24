
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
  
  
scenario: Jenkins installation 
========
here we are going to use, what we learned till now 
 i.e variables
     exit status 
	 conditions 
	 function 






