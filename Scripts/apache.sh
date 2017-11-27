#!/bin/bash -ex 

sudo yum install -y httpd

sudo groupadd www
sudo usermod -a -G www ec2-user

sudo chown -R root:www /var/www
sudo chmod 2775 /var/www

sudo find /var/www -type d -exec chmod 2775 {} +
sudo find /var/www -type f -exec chmod 0664 {} +
