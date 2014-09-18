#!/bin/bash


function installGen {
	sudo npm install -g $1
}

echo "This script will be used to install the generators for yeoman"

title="Installing Generators"
prompt="Pick an option:"
options=("Install All Generators" "Install Webapp Generator" "Install Angular Generator" "Install polymer Generator" "Install Node Express Generator")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) 
		echo "Installing All Generators"
		sudo npm install -g generator-angular generator-webapp generator-polymer generator-express
		echo "Goodbye!"; 
		break;;
    2 ) 
		echo "Installing Webapp Generator"
		installGen generator-webapp
		;;
    3 ) 
		echo "Installing Angular Generator"
		installGen generator-angular
		;;
	4 ) 
		echo "Installing Polymer Generator"
		installGen generator-polymer
		;;
	5 ) 
		echo "Installing Express Generator"
		installGen generator-express
		;;

    $(( ${#options[@]}+1 )) ) 
		echo "Goodbye!"; 
		break;;
    
    *) 
		echo "Invalid option. Try another one.";
		continue;;

    esac

done