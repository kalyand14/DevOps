# Certified Jenkins Engineer Path

While setting up the VmWare and Vagrant box in MAc, i got below error 

### VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component MachineWrap, interface IMachine

Solution: https://scriptcrunch.com/solved-vboxmanage-error-component-machinewrap/

### 11 Jun 2022 - 

1. Create Jenkins Master(EC2) - Slave(EC2) configuration
2. No jobs should be execture in Master. No. of Executers should be '0'
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
    
