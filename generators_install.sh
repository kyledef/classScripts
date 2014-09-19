#!/bin/bash


function installGen {
	sudo npm install -g $1
}


change=false


NODEVER=$(node --version)
if [ "$NODEVER" == "v0.10.25" ];
	then
		read -p "You need to Upgrade Dependencies before continuing. Upgrade? Y/n " yn
		case $yn in
			[Yy]* )
				#Uninstall old version as simple upgrade causing conflict problems
				sudo apt-get -y --purge remove nodejs nodejs-legacy;
				# Removed all installed modules
				sudo rm -rf /usr/lib/node_modules/
				#Unisntall any remaining packages not needed
				sudo apt-get -y autoremove;
				sudo add-apt-repository -y ppa:chris-lea/node.js 
				sudo apt-get update;
				sudo apt-get -y install nodejs;
				sudo apt-get dist-upgrade -y;
				sudo npm -g update;
				change=true
		esac
else
	YOVER=$(yo -version)
	if [ "$YOVER" == "1.1.2" ];
		then
			sudo npm -g update
			change=true
	fi
fi

if $change; then
	read -p "Do you wish to restart now to complete installation? y/N " yn
	case $yn in
	    [Yy]* ) sudo reboot;
	esac 
fi


echo "This script will be used to install the generators for yeoman"

title="Installing Generators"
prompt="Pick an option:"
options=("Install All Generators (Recommended)" "Install Webapp Generator" "Install Angular Generator" "Install polymer Generator" "Install Node Express Generator")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) 
		echo "Installing All Generators";
		sudo npm install -g generator-angular generator-webapp generator-polymer generator-express;
		echo "Goodbye!"; 
		break;;
    2 ) 
		echo "Installing Webapp Generator";
		installGen generator-webapp;
		;;
    3 ) 
		echo "Installing Angular Generator";
		installGen generator-angular;
		;;
	4 ) 
		echo "Installing Polymer Generator";
		installGen generator-polymer;
		;;
	5 ) 
		echo "Installing Express Generator";
		installGen generator-express;
		;;

    $(( ${#options[@]}+1 )) ) 
		echo "Goodbye!"; 
		break;;
    
    *) 
		echo "Invalid option. Try another one.";
		continue;;

    esac

done