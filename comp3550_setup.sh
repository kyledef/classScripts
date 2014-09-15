#!/bin/bash


sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:paolorotolo/android-studio

sudo apt-get update


sudo apt-get install -y git oracle-java8-installer sublime-text-installer nodejs nodejs-legacy npm apache2 php5 php5-mysql mysql-server-5.6 mysql-client-5.6 phpmyadmin php5-mcrypt


# Install dependencies for PHP development

# Enable the Mcrypt for more robust encryption & hashing
sudo php5enmod mcrypt
sudo service apache2 restart

# Install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer


#Install Yeoman Tool
sudo npm install -g yo grunt-cli bower

mkdir ~/dev

sudo apt-get dist-upgrade -y

read -p "Do you wish to restart now to complete installation? Y/n" yn
case $yn in
    [Yy]* ) sudo reboot; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer [y]yes or [n]no.";;
esac
done