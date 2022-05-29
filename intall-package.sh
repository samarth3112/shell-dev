#!/bin/bash



installer()

{ 
	pck_name=$1
	echo "######Installer invoked #######"
	echo "Package is $pck_name"
	
	if which $pck_name &> /dev/null
	then
		echo "$pck_name is already installed.. will exit "
		
	else
    		echo "Package $pck_name is not already installed...attempting  download and install"
		apt-get install $pck_name -y  &> /dev/null

		if [[ $? -eq 0 ]]
		then 
		       echo "Successfully installed $pck_name"
		else
			echo "install failed"
			break
		fi


       fi
	
	}




cat package.txt | awk 'NR!=1 {print}' | while IFS=","  read f1 f2  f3 

do  
	
 	echo "The package  needs to be installed is :  $f3 by user $f1 with uid $f2 "
        installer $f3
done

