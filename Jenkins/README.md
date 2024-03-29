# Certified Jenkins Engineer Path

https://hackr.io/blog/jenkins-certification

While setting up the VmWare and Vagrant box in MAc, i got below error 

Jenkins - Kubernetes deployment : https://www.youtube.com/watch?v=wIwEqr1AQ84&list=PLnKRMdDSbUHCN1lrfgVYsrZu1vhs4FZSk&index=7

### VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component MachineWrap, interface IMachine

Solution: https://scriptcrunch.com/solved-vboxmanage-error-component-machinewrap/

# Daily Jenkins Task

### 10 Jun 2022 - 

1. Create Jenkins Master(EC2) - Slave(EC2) configuration
2. No jobs should be executed in Master. Set No. of Executers in master as '0'
3. Run pipeline jobs using Dynamic docker agent in the slave - Git: https://github.com/darinpope/jenkins-example-docker.git

#### Jenkins Master  - Steps involved in it

1. Create a new EC2 instance in AWS 
2. Create new Keypair for SSH connectivity as jenkins-master.pem
3. Download the SSH private key to SSH from working system
4. SSH into the instance and install required pacakges as mentioned in - https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
5. Install Git as it needed by piepline jobs

#### Jenkins Slave - Steps involved in it

1. Create a new EC2 instance in AWS
2. Create new Keypair for SSH connectivity as jenkins-slave.pem
3. Configure Security Group to allow only SSH connection from Master SSH
4. Download the SSH private key to SSH and move it into Jenkins master
5. Install java 11 - sudo amazon-linux-extras install java-openjdk11 -y
6. Install Docker
    a. install docker - sudo yum install docker -y
    b. start docker - sudo systemctl start docker
    c. add current user to docker group - sudo usermod -a -G docker $USER
    d. Allow access to docker.sock file - chmod 777 /var/run/docker.sock
 
 #### Jenkis controller  - configure slave in master
 
 1. Create agent "Jenkins-Slave" under Manage Jenkins --> New node
 2. Configure Remote root directory - /home/ec2-user
 3. Configure Labels
 4. Launch method - Launch agents via SSH
 5. Host - Give the <b>Private IP address</b> of the agent machine
 6. Credentials - create username with private SSH key - use the private key downloaed for slave machine
 7. Host key verification Stratergy - Manully trusted key verification stratergy

#### Jenkis controller  - configure docker dynamic agent

1. Install <b>docker pipeline</b> plugin

### 11 Jun 2022 - 

1. Create Jenkins Master(EC2) - Sclable Slave(EC2) configuration

#### AWS

1. Create policy and role to allow the EC2 instance ( wherer jenkins master is running) to create other EC2 instance

Refer - https://plugins.jenkins.io/ec2/#plugin-content-iam-setup

2. Add the newly created role to the EC2 master instance

#### Jenkins Master

1. Install the <b>AWS EC2 plugin</b> and configure it as below.

Instance configuration

a. Name the instance
b. Select the region
c. Configure the EC2 SSH private key as Credentials

AMIs configuration

a. Give description
b. AMI ID - use valid AMI ID from AWS
c. Instance Type - T2Micro
d. Security Group - allow the connection only form master EC2 instance
e. Remote user:  ec2-user
f. AMI Type: unix
g.Labels: jenkins-ec2-plugin-slave

Advance Configuration

a. Number of Executors - 5
b. Subset ID for VPC
c.  Host key Verification Starategy - accept - new


#### Jenkins Slave

Will automatically created and shutdown after 5 mins ideal time

if you want preinstalled software then create new AMI with backed image

### 11 Jun 2022 - 

1. Create Authorization Strategy for Jenkins

### 12 Jun 2022 - 

1. Create Backup Strategy for Jenkins