#!/bin/bash

echo "Installing Base requirements: (Java, Sublime, Git)"

sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# Remove requirements for user confirmation of java liscense
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
sudo apt-get install -y git oracle-java8-installer sublime-text-installer curl nautilus-open-terminal


read -p "Install Nodejs y/N " yn
case $yn in
	[Yy]* ) 
		curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash - && sudo apt-get install -y nodejs
esac

read -p "Install Command Line Interface (CLI) Tools y/N " yn
case $yn in
	[Yy]* ) 
		echo "Installing Node. Node is a dependency for CLI tools"
		curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash - && sudo apt-get install -y nodejs
		echo "Installing CLI Tools (Grunt, Bower, yo, Gulp)"
		#Install Yeoman Tool
		sudo npm install -g grunt-cli bower yo gulp

		echo "Testing packages"
		yo --version
		grunt --version
		bower -v
		gulp -v
esac

read -p "Install python development tools y/N" yn
case $yn in
	[Yy]* ) 
		sudo apt-get install -y python-pip python-virtualenv python-dev libblas-dev liblapack-dev python-dev libatlas-base-dev gfortran
esac


read -p "Install LAMP Stack y/N" yn
case $yn in
	[Yy]* ) 
		sudo apt-get install -y apache2 php5 php5-mysql mysql-server-5.6 mysql-client-5.6 phpmyadmin php5-mcrypt apache2-utils
		echo "Configuring Apache Installation"
		sudo a2enmod rewrite
		echo "Change the default.conf file to AllowOverride All"
		sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default.confg
		sudo php5enmod mcrypt
		sudo service apache2 restart
		# Install composer
		echo "Installing Composer"
		curl -sS https://getcomposer.org/installer | php
		sudo mv composer.phar /usr/local/bin/composer
		composer --version
esac

read -p "Would you like to upgrade all the software in the system. Note while this is advisable it will take a considerable amount of time. y/N " yn
case $yn in
    [Yy]* ) sudo apt-get dist-upgrade -y;
esac

read -p "Do you wish to restart now to complete installation? y/N " yn
case $yn in
    [Yy]* ) sudo reboot;
esac
