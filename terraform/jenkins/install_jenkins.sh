#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install Apache webserver"
yum install -y httpd.x86_64
#systemctl start httpd.service
#systemctl enable httpd.service
#echo Hello World from $(hostname -f) > /var/www/html/index.html

echo "Install Jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

amazon-linux-extras install epel 
amazon-linux-extras install java-openjdk11  
yum install -y jenkins

sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on

chkconfig jenkins on

echo "Start Jenkins"
systemctl start jenkins
echo "Start docker"
systemctl start docker 
