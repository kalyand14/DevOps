#!/bin/bash
sudo yum -y update

yum install -y httpd.x86_64

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

amazon-linux-extras install epel 
amazon-linux-extras install java-openjdk11  
yum install -y jenkins

systemctl start httpd.service
systemctl enable httpd.service
echo Hello World from $(hostname -f) > /var/www/html/index.html

systemctl start jenkins

chkconfig jenkins on
