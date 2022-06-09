# DevOps - Playground for DevOps Task

Guide - https://www.bogotobogo.com/DevOps/Docker/Docker-Jenkins-Master-Slave-Agent-ssh.php

## Deploy Jenkins and configure it

### How to change jenkins home directory

https://phoenixnap.com/kb/change-jenkins-home-directory

### Deploy Jenkins

- [X] Deploy jenkins in EC2 using CloudFromation
- [X] Deploy jenkins in EC2 using Terraform 

### Create Jenkins Piepline

Sample Git Repo - https://github.com/jenkins-docs

#### Simple Pipeline: Validation -> Checkout -> Build -> Deploy

#### Full blown Pipeline: Validation -> Checkout -> Build --> Unit Test --> Code Quality -> Upload Artifact -> Deploy to Dev -> Slack Notification --> Approval for QA Deploy --> Deploy to QA --> Approval for Prod Deploy --> Deploy to Prod

#### Deploy WEB application

- [ ] Build and Deploy Java Application (Maven and Gradle)
- [ ] Build and Deploy Angular Application 
- [ ] Build and Deploy Python Application

#### Deploy Microservice application

- [ ] Build and Deploy SPringBoot Microservice Application into Kubernetes Cluster
- [ ] Build and Deploy NodeJS Microservice Application into Kubernetes Cluster

#### Deploy Mobile application

- [ ] Build Android application and deploy artificat into Nexus
- [ ] Build iOS application and deploy artificat into Nexus

### Configure Jenkins

- [ ] Update the required plugin (Maven, Gradle)
- [ ] Configure with master and slave nodes


## AWS

### How to install AWS CLI in Mac

Step1: curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

Step2: sudo installer -pkg AWSCLIV2.pkg -target /

Step3: which aws

Step4: aws configure


----------------------------------

### Cost Optimize your Jenkins CI/CD pipelines using EC2 Spot Instances

https://aws.amazon.com/blogs/compute/cost-optimize-your-jenkins-ci-cd-pipelines-using-ec2-spot-instances/

### Blogs

DevOps Coach

https://www.coachdevops.com/2019/03/top-10-challenges-in-implementing-or.html

https://www.youtube.com/watch?v=f0Rbk1iVhnc&t=139s
