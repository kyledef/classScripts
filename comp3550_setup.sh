#!/bin/bash


sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:paolorotolo/android-studio

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
composer global require "laravel/installer=~1.1"
# touch ~/.pam_environment
# echo "PATH DEFAULT=${PATH}:~/.composer/vendor/bin" >> ~/.pam_environment
sudo echo "PATH DEFAULT=${PATH}:~/.composer/vendor/bin" >> /etc/profile

mkdir ~/dev

read -p "Would you like to upgrade all the software in the system. Note while this is advisable it will take a considerable amount of time. Y/n " yn
case $yn in
    [Yy]* ) sudo apt-get dist-upgrade -y;
esac



read -p "Do you wish to restart now to complete installation? Y/n " yn
case $yn in
    [Yy]* ) sudo reboot;
esac
