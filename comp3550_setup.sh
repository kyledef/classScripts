#!/bin/bash


sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:paolorotolo/android-studio
sudo add-apt-repository -y ppa:chris-lea/node.js 

sudo apt-get update

sudo apt-get install -y git oracle-java8-installer sublime-text-installer nodejs nodejs-legacy npm apache2 php5 php5-mysql mysql-server-5.6 mysql-client-5.6 phpmyadmin php5-mcrypt curl


# Install dependencies for PHP development

# Enable the Mcrypt for more robust encryption & hashing
sudo php5enmod mcrypt
sudo service apache2 restart

#Install Yeoman Tool
sudo npm install -g grunt-cli bower yo 

# Install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install Laravel
read -p "The installation of Laravel takes some time. Will you like to install this now y/N" yn
case $yn in
	[Yy]* ) sudo composer global require "laravel/installer=~1.1"
esac


mkdir ~/dev




read -p "Would you like to upgrade all the software in the system. Note while this is advisable it will take a considerable amount of time. y/N " yn
case $yn in
    [Yy]* ) sudo apt-get dist-upgrade -y;
esac



read -p "Do you wish to restart now to complete installation? y/N " yn
case $yn in
    [Yy]* ) sudo reboot;
esac
